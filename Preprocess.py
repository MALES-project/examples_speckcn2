
# Load the necessary packages
import torch
import torchvision.transforms as transforms
import os
import sys

from speckcn2.io import prepare_data, normalize_tags, train_test_split
from speckcn2.mlmodels import get_resnet50
from speckcn2.mlops import train, score
from speckcn2.histos import tags_distribution



# Set hyperparameters
final_epoch = 5
batch_size = 32
learning_rate = 0.001


# Set the screen parameters that will select the data to be used
nscreens = 8
original_resolution = 1024
# which correspond to the following directory
datadirectory = f'{nscreens}screens_{original_resolution}x{original_resolution}'


# Set the device
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
print(f'Using {device}.')


# Define the transformation to apply to each image
transform = transforms.Compose([
    # Randomly rotate the image, since it is symmetric
    transforms.RandomRotation(degrees=(-180, 180)),
    # Take only the center of the image
    transforms.CenterCrop(410),
    # Optionally, downscale it
    transforms.Resize(256),
    transforms.ToTensor(),
])

# In[8]:

# Load or preprocess the data
all_images, all_tags = prepare_data(datadirectory,
                                    transform,
                                    nimg_print=5,
                                    nreps=2)


# Normalize the tags between 0 and 1
dataset, normalize_tag, recover_tag = normalize_tags(all_images, all_tags)


# Split the data in training and testing
train_loader, test_loader = train_test_split(dataset, batch_size, 0.8)


# Load the model that you want to use
model, last_model_state = get_resnet50(nscreens, datadirectory)

# and set the model to run on the device
model = model.to(device)


# Define the loss function and optimizer
criterion = torch.nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)


# Train the model...
model, average_loss = train(model, last_model_state, final_epoch, train_loader,
                            device, optimizer, criterion)
print(f'Finished Training, Loss: {average_loss:.4f}')

# In[14]:

# Save the model state
torch.save(model.state_dict(),
           f'{datadirectory}/model_states/model_{final_epoch}.pth')

# In[15]:

# Now test the model
test_tags = score(model, test_loader, device, criterion, recover_tag)

# In[16]:

# Print some statistics of the screen tags
tags_distribution(dataset, test_tags, device)
