# Configuration File Explanation

Here we explain what it is expected in a typical `configuration.yaml` file:

#### speckle
* **nscreens**: The number of screens used in the simulation.
* **original_res**: The original resolution of the images.
* **datadirectory**: The directory where the data files are located.

#### preproc
* **polarize**: A boolean value indicating whether the images should be transformed into polar coordinate.
* **polresize**: The size to which the polarized images are resized.
* **equivariant**: A boolean value indicating whether the images should be made pseudo-equivariant, by setting the azimutal angle to the maximum pixel intensity.
* **randomrotate**: A boolean value indicating whether the images should be randomly rotated.
* **centercrop**: The size of the central crop of the images. Test this value to guarantee that the empty boundaries are removed.
* **resize**: The size to which the images are resized.
* **speckreps**: The number of times that we want to repeat each speckle pattern in order to augment the data. Use only in combination with random rotations.
* **multichannel**: The number of speckle pattern from the same Cn2 to use as image channels.
* **dataname**: The name of the file where the preprocessed images are saved.

#### model
* **name**: String representing the name of the model. Used to store states and plots. It can be any name.
* **type**: The type of the model. We have implemented `resnet18`, `resnet50`, `resnet152` from the ResNet family, and `scnnC8`, `scnnC16`, `small_scnnC16`, which are equivariant CNN.
* **save_every**: The frequency (in epochs) at which the model is saved.
* **pretrained**: A boolean value indicating whether a pretrained model should be used. It is available only for the ResNet.

#### hyppar
* **maxepochs**: The maximum number of epochs for training the model.
* **batch_size**: The size of the batches used in training.
* **lr**: The learning rate for the optimizer.
* **loss**: The loss function used in training. We have implemented `MSELoss`, `BCELoss` and `Pearson`.
* **optimizer**: The optimizer used in training.
