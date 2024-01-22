#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Load the necessary packages
import torch
import torchvision.transforms as transforms

from speckcn2.io import load_config
from speckcn2.preprocess import prepare_data, normalize_tags, train_test_split
from speckcn2.mlmodels import setup_model, setup_loss, setup_optimizer
from speckcn2.mlops import train, score
from speckcn2.postprocess import tags_distribution


# In[2]:


# Load the configuration file
#config = load_config(sys.argv[1])
config = load_config('configuration.yaml')


# In[3]:


# Get some parameters from YAML file
datadirectory = config['speckle']['datadirectory']


# In[4]:


# Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f'Using {device}.')


# In[5]:


# Define the transformation to apply to each image
transform = transforms.Compose([
    # Randomly rotate the image, since it is symmetric
    transforms.RandomRotation(degrees=(-180, 180)),
    # Take only the center of the image
    transforms.CenterCrop(config['speckle']['centercrop']),
    # Optionally, downscale it
    transforms.Resize(config['speckle']['resize']),
    transforms.ToTensor(),
])


# In[6]:


# Load or preprocess the data
all_images, all_tags = prepare_data(datadirectory,
                                    transform,
                                    nimg_print=5,
                                    nreps=2)


# In[7]:


# Normalize the tags between 0 and 1
dataset, normalize_tag, recover_tag = normalize_tags(all_images, all_tags)


# In[8]:


# Split the data in training and testing
train_loader, test_loader = train_test_split(dataset,
                                             config['hyppar']['batch_size'],
                                             0.8)


# In[9]:


# Load the model that you want to use
model, last_model_state = setup_model(config)
# and set the model to run on the device
model = model.to(device)


# In[10]:


# Define the loss function and optimizer
criterion = setup_loss(config)
optimizer = setup_optimizer(config, model)


# In[11]:


# Train the model...
model, average_loss = train(model, last_model_state, config, train_loader,
                            device, optimizer, criterion)
print(f'Finished Training, Loss: {average_loss:.4f}')


# In[12]:


# Now test the model
test_tags = score(model, test_loader, device, criterion, recover_tag,
                  datadirectory)


# In[13]:


# Print some statistics of the screen tags
tags_distribution(dataset, test_tags, device, datadirectory)

