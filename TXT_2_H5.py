import os
import numpy as np
import h5py

# Directory containing the .txt files
txt_dir = '.'

# Output directory for the HDF5 files
hdf5_dir = '.'

for filename in os.listdir(txt_dir):
    if filename.endswith('.txt'):
        # Load the .txt file as a numpy array
        data = np.loadtxt(os.path.join(txt_dir, filename), delimiter=',', dtype=np.float32)

        # Create a new HDF5 file for this dataset
        with h5py.File(os.path.join(hdf5_dir, filename[:-4] + '.h5'), 'w') as f:
            f.create_dataset('data', data=data)

        # Delete the original .txt file
        os.remove(os.path.join(txt_dir, filename))
