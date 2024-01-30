#!/bin/sh

RUN_NAME='ResNet50'
#SBATCH --job-name=MALES-${RUN_NAME}
#SBATCH --output=slurm/slurm-MALES-${RUN_NAME}.out
#SBATCH --error=slurm/slurm-MALES-${RUN_NAME}.err
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=1G
#SBATCH --gpus-per-task=1
#SBATCH --account=research-AE-SPE

module load 2023r1
module load python/3.9.8
module load py-pip

python Prototype.py $1 
