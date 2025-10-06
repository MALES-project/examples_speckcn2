# Examples SpeckleCn2Profiler

Here you find examples on the usage of SpeckleCn2Profiler.

## Getting started
Refer to the [SpeckleCn2Profiler: Getting started](https://github.com/MALES-project/SpeckleCn2Profiler#getting-started) section.

Once you have SpeckleCn2Profiler installed, you can run any example scripts as follows:

```console
python3 example_train.py <path_to_config.yml>
```

## Examples

### Main Example Scripts
- `example_train.py`: Learn how to train your ML model using SpeckleCn2Profiler.
- `example_post.py`: Learn how to load a trained ML model and run some analysis on the results.

### Utility Scripts
- `scripts/TXT_2_H5.py`: Convert text data files to HDF5 format for better performance.
- `scripts/py_to_ipynb.py`: Convert Python scripts to Jupyter notebooks for interactive use.

### SLURM Scripts (for HPC environments)
- `MULTI_slurm_submit.sh`: Submit multiple training jobs to SLURM scheduler with different configurations.
- `sub_train_and_post.sh`: SLURM submission script for training and post-processing.
- `sub_train_and_post_long_queue.sh`: SLURM submission script for long-running jobs.

### Configuration Files
The `configurations/` directory contains various pre-configured YAML files for different model architectures:
- ResNet models: `configuration_ResNet18.yaml`, `configuration_ResNet50.yaml`, `configuration_ResNet152.yaml`
- SCNN models: `configuration_C4.yaml`
- Hard difficulty variants: `configuration_ResNet18_hard.yaml`, `configuration_ResNet50_hard.yaml`, `configuration_C4_hard.yaml`  
- Additional variants: `configuration_ResNet50_hsym.yaml`, `configuration_ResNet50_hard_v2.yaml`, `configuration_ResNet50_hsym_v2.yaml`

## Configuration File Explanation

Here we explain what it is expected in a typical `configuration.yaml` file:

#### speckle
* **nscreens**: The number of screens used in the simulation.
* **hArray**: Array corresponding to the altitudes of the screens (in meters).
* **splits**: Array of distances between consecutive screens (in meters).
* **lambda**: The wavelength of the laser (in nanometers).
* **z**: Height of the observation point (typically 0 for ground-based observations).
* **L**: Total propagation distance through the atmosphere (in meters).
* **original_res**: The original resolution of the images (in pixels).
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
* **name**: String representing the name of the model. Used to store states and plots. It can be any descriptive name.
* **type**: The type of the model architecture. Available options include:
  - ResNet family: `resnet18`, `resnet50`, `resnet152` (traditional convolutional neural networks)
  - SCNN family: `scnnC8`, `scnnC16`, `small_scnnC16` (rotation-equivariant CNNs optimized for speckle patterns)
* **save_every**: The frequency (in epochs) at which the model state is saved to disk.
* **pretrained**: A boolean value indicating whether a pretrained model should be used as initialization. Available only for ResNet models.

#### hyppar
* **maxepochs**: The maximum number of epochs for training the model.
* **ttsplit**: The fraction of data used for training (e.g., 0.8 means 80% training, 20% testing).
* **batch_size**: The size of the batches used in training.
* **lr**: The learning rate for the optimizer.
* **lr_scheduler**: The learning rate scheduler used in training. Available options: `StepLR`, `ReduceLROnPlateau` (also referred to as `Plateau`), and `CosineAnnealingLR`.
* **early_stopping**: The number of epochs of plateau to wait before stopping the training.
* **optimizer**: The optimizer used in training (e.g., `Adam`, `SGD`).

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
This block is used to define the architecture of the final block of any model to get from the image features to the tag predictions. This block has usually a fully connected structure, but here you can control the number of layers, the number of neurons in each layer, regularization, activation, etc. A reference example is provided in the `configuration.yaml` file.

## Utility Scripts

### Data Conversion
- **`scripts/TXT_2_H5.py`**: Converts text-based data files to HDF5 format for improved I/O performance. This script is useful when working with large datasets where HDF5's efficient storage and access patterns provide significant speed improvements over plain text files.

### Development Tools
- **`scripts/py_to_ipynb.py`**: Converts Python scripts to Jupyter notebook format using the `p2j` tool. This is helpful for creating interactive versions of the example scripts for educational or exploratory purposes.

## SLURM Integration

For users working on High Performance Computing (HPC) systems with SLURM scheduler, several submission scripts are provided:

- **`MULTI_slurm_submit.sh`**: Batch submission script that can submit multiple training jobs with different configurations. Most lines are commented out by default - uncomment the configurations you want to run.

- **`sub_train_and_post.sh`**: SLURM job script that runs both training and post-processing in sequence.

- **`sub_train_and_post_long_queue.sh`**: Similar to the above but designed for longer-running jobs that require extended queue time.

### Usage Example
```bash
# Submit a single job
sbatch --job-name=MyModel --output=slurm/output.out --error=slurm/error.err sub_train_and_post.sh configurations/configuration_ResNet50.yaml

# Submit multiple jobs using the batch script
bash MULTI_slurm_submit.sh
```
