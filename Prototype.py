## Prototype of the Machine Learning Pipeline

# Load the necessary packages
import sys
import os
import torch
import pickle
from speckcn2 import *

# Load the configuration file
# this file contains all the information related to how to preprocess the data and which model to use
config = load_config(sys.argv[1])
# one of which is the path to the data, that we need to store in this variable
datadirectory = config['speckle']['datadirectory']

# Set the device: if a GPU is available, we use it
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using {device}.', flush=True)

# Preprocess the data
# if a database of the preprocess data exist, then we just load it
all_images, all_tags, all_ensemble_ids = prepare_data(config, nimg_print=15)

# Normalize the tags between 0 and 1
# this will help the model by giving it more reasonable numbers to work with
nz = Normalizer(config)
dataset = nz.normalize_imgs_and_tags(all_images, all_tags, all_ensemble_ids)

# Split the data in training and testing
train_set, test_set = train_test_split(config, dataset)

# Load the model that you want to use
model, last_model_state = setup_model(config)
# and set the model to run on the device
model = model.to(device)

# Define the loss function and optimizer
criterion = setup_loss(config)
optimizer = setup_optimizer(config, model)

# (!) Train the model
model, average_loss = train(model, last_model_state, config, train_set,
                            test_set, device, optimizer, criterion)
print(f'Finished Training, Loss: {average_loss:.5f}', flush=True)

# Now test the model, while also producing some plots
test_tags = score(model, test_set, device, criterion, nz)

# Finaly we do some postprocessing analysis
# Plot the distribution of the screen tags
tags_distribution(config, train_set, test_tags, device)
tags_distribution(config, train_set, test_tags, device, rescale=True, recover_tag=nz.recover_tag)
# Plot the loss during training
plot_loss(config, model, datadirectory)
# Plot the execution time
plot_time(config, model, datadirectory)
