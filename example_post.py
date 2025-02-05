# Prototype of the postprocessing pipeline

# Load the necessary packages
from __future__ import annotations

import sys
import torch
import numpy as np
import random
import speckcn2 as sp2

def main(conf_name):
    # Load the configuration file
    # this file contains all the information related to how to preprocess the data and which model to use
    config = sp2.load_config(conf_name)
    # one of which is the path to the data, that we need to store in this variable
    datadirectory = config['speckle']['datadirectory']
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    # If seed is specified in the configuration file, we set it here, otherwise use a default 
    seed = config.get('seed', 42)
    torch.manual_seed(seed)
    np.random.seed(seed)
    random.seed(seed)
    
    # Load the model that you want to use and the weights
    model, last_model_state = sp2.setup_model(config)
    model, _ = sp2.load_model_state(model, datadirectory)

    # set the model to the correct device
    model.to(device)
    
    # Preprocess the data. If a database of the preprocess data exist, then we just load it
    all_images, all_tags, all_ensemble_ids = sp2.prepare_data(config,
                                                              nimg_print=15)
    
    # Normalize the tags between 0 and 1. This will help the model by giving it more reasonable numbers to work with
    nz = sp2.Normalizer(config)
    
    # Split the data in training and testing
    train_set, test_set = sp2.train_test_split(all_images, all_tags,
                                               all_ensemble_ids, nz)
    
    # Re-create the loss function
    criterion = sp2.ComposableLoss(config, nz, device)
    
    # Test the model
    test_tags, test_losses, test_measures, test_cn2_pred, test_cn2_true, test_recovered_tag_pred, test_recovered_tag_true = sp2.score(
        model, test_set, device, criterion, nz, nimg_plot=0)
    sp2.plot_samples_in_ensemble(config, test_set, device, model, criterion, trimming=0.1, n_max_plots=100)
     
    # Compute some overall statistics
    sp2.plot_total_statistics(config, train_set, criterion, device)
    
    # Test to see if averaging over speckle patterns improves the results
    sp2.average_speckle_input(config, test_set, device, model, criterion, n_ensembles_to_plot=5)
    sp2.average_speckle_output(config, test_set, device, model, criterion, trimming=0.2, n_ensembles_to_plot=20)
    
    # Finally we do some postprocessing analysis
    # Plot the distribution of the screen tags
    sp2.plot_J_error_details(config, test_recovered_tag_true, test_recovered_tag_pred)
    sp2.screen_errors(config, device, test_recovered_tag_pred, test_recovered_tag_true, nbins=20)
    sp2.tags_distribution(config, train_set, test_tags, device, rescale=False)
    sp2.tags_distribution(config,
                          train_set,
                          test_tags,
                          device,
                          rescale=True,
                          recover_tag=nz.recover_tag)
    
    # Plot the histograms of the loss function
    sp2.plot_histo_losses(config, test_losses, datadirectory)
    # Plot the loss during training
    sp2.plot_loss(config, model, datadirectory)
    # Plot the execution time
    sp2.plot_time(config, model, datadirectory)
    # Plot histograms of the different parameters
    sp2.plot_param_histo(config, test_losses, datadirectory, test_measures)
    # Plot the parameters of the model vs the loss
    sp2.plot_param_vs_loss(config, test_losses, datadirectory, test_measures)

if __name__ == '__main__':
    main(sys.argv[1])
