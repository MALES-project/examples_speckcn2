# Configuration File Explanation

Here we explain what it is expected in a typical `configuration.yaml` file:

#### speckle
* **nscreens**: The number of screens used in the simulation.
* **hArray**: array corresponding to the altitudes of the screens.
* **split**: The distance from the next screen.
* **lambda**: The wavelength of the laser.
* **z**: ?
* **L**: ?
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
* **ensemble**: The number of speckle patterns to use as ensemble. This is to train multi-shoot models.
* **ensemble_unif**: A boolean value indicating whether the ensemble is uniformly sampled.
* **normalization**: How to normalize the tags: `unif`, `lin`, `log` or `zscore`.
* **img_normalization**: if `true` normalize the pixel values of the images.
* **dataname**: The name of the file where the preprocessed images are saved.
* **XXX_details**: If `true` then plot the bin resolved details of `XXX` metrics 

#### noise
* **D**: Fraction of the field.
* **t**: Width of the spider.
* **snr**: Signal to noise ratio.
* **dT**: Telescope diameter.
* **dO**: Fraction of obscuration.
* **rn**: Amplitude of the noise.
* **fw**: Full well capacity.
* **bit**: Bit level (sample depth).
* **discretize**: A boolean value indicating whether the images should be discretized.

#### model
* **name**: String representing the name of the model. Used to store states and plots. It can be any name.
* **type**: The type of the model. We have implemented `resnet18`, `resnet50`, `resnet152` from the ResNet family, and `scnnC8`, `scnnC16`, `small_scnnC16`, which are equivariant CNN.
* **save_every**: The frequency (in epochs) at which the model is saved.
* **pretrained**: A boolean value indicating whether a pretrained model should be used. It is available only for the ResNet.

#### hyppar
* **maxepochs**: The maximum number of epochs for training the model.
* **batch_size**: The size of the batches used in training.
* **lr**: The learning rate for the optimizer.
* **lr_scheduler**: The learning rate scheduler used in training. We have implemented `StepLR`, `ReduceLROnPlateau` and `CosineAnnealingLR`.
* **loss**: The loss function used in training. We have implemented `MSELoss`, `BCELoss` and `Pearson`.
* **early_stopping**: The number of epochs of plateau to wait before stopping the training.
* **optimizer**: The optimizer used in training.

#### loss
* **XXX**: The weight of the loss `XXX` in the total loss. The total loss is the sum of all the losses weighted by their respective weights. A value of 0 means that the loss is not used. The list of available losses includes:
* This section of the YAML file defines the configuration for different loss functions used in a machine learning model. Each key represents a specific type of loss function, and the corresponding value indicates whether that loss function is enabled (1) or disabled (0). Here is a brief explanation of each loss function:
- **MAE (Mean Absolute Error)**: Measures the average magnitude of errors between predicted and actual values.
- **MSE (Mean Squared Error)**: Measures the average of the squares of the errors between predicted and actual values.
- **JMAE**: A variant of MAE that is computed over J, so the screen tag are reconstructed before the evaluation.
- **JMSE**: A variant of MSE that is computed over J, so the screen tag are reconstructed before the evaluation.
- **Cn2MAE**: Mean Absolute Error specific to Cn2 (a parameter related to atmospheric turbulence).
- **Cn2MSE**: Mean Squared Error specific to Cn2.
- **Pearson**: Measures the Pearson correlation coefficient between predicted and actual values.
- **Fried**: A loss function related to the Fried parameter, which is used in optical turbulence.
- **Isoplanatic**: A loss function related to the isoplanatic angle, another parameter in optical turbulence.
- **Rytov**: A loss function related to the Rytov variance, which is used in wave propagation.
- **Scintillation_w**: A loss function related to the weak scintillation index.
- **Scintillation_ms**: A loss function related to the medium-strong scintillation index.

#### scnn
This block is used to define the architecture of the SCNN models. The keys are the names of the layers, and the values are the number of filters in each layer. The SCNN models are equivariant CNNs that are used to process the speckle images. A reference example is provided in the `configuration.yaml` file.

#### final_block
This block is used to define the architecture of the final block of any model to get from the image features to the tag predictions. This block has usually a fully connected structure, but here you can control the number of layers, the number of neurons in each layer, regularization, activation, ecc. A reference example is provided in the `configuration.yaml` file.