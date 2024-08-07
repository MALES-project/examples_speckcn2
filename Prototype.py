## Prototype of the Machine Learning Pipeline

# Load the necessary packages
from __future__ import annotations

import sys

import torch

from speckcn2 import *

# Load the configuration file
# this file contains all the information related to how to preprocess the data and which model to use
config = load_config(sys.argv[1])
# one of which is the path to the data, that we need to store in this variable
datadirectory = config['speckle']['datadirectory']

# Set the device: if a GPU is available, we use it
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using {device}.', flush=True)

# Preprocess the data. If a database of the preprocess data exist, then we just load it
all_images, all_tags, all_ensemble_ids = prepare_data(config, nimg_print=15)

# Normalize the tags between 0 and 1. This will help the model by giving it more reasonable numbers to work with
nz = Normalizer(config)

# Split the data in training and testing
train_set, test_set = train_test_split(all_images, all_tags, all_ensemble_ids,
                                       nz)

# Load the model that you want to use
model, last_model_state = setup_model(config)
# and set the model to run on the device
model = model.to(device)

# Define the loss function and optimizer
criterion = ComposableLoss(config, nz, device)
criterion = criterion.to(device)
optimizer = setup_optimizer(config, model)

# (!) Train the model
model, average_loss = train(model, last_model_state, config, train_set,
                            test_set, device, optimizer, criterion)
print(f'Finished Training, Loss: {average_loss:.5f}', flush=True)

# Now test the model, while also producing some plots
test_tags, test_losses, test_measures, test_cn2_pred, test_cn2_true, test_recovered_tag_pred, test_recovered_tag_true = score(
    model, test_set, device, criterion, nz, nimg_plot=100)

# Finaly we do some postprocessing analysis
# Plot the distribution of the screen tags
tags_distribution(config, train_set, test_tags, device, rescale=False)
tags_distribution(config,
                  train_set,
                  test_tags,
                  device,
                  rescale=True,
                  recover_tag=nz.recover_tag)
# Plot the histograms of the loss function
plot_histo_losses(config, test_losses, datadirectory)
# Plot the loss during training
plot_loss(config, model, datadirectory)
# Plot the execution time
plot_time(config, model, datadirectory)
# Plot histograms of the different parameters
plot_param_histo(config, test_losses, datadirectory, test_measures)
# Plot the parameters of the model vs the loss
plot_param_vs_loss(config, test_losses, datadirectory, test_measures)
