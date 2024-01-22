#!/bin/sh
#
#SBATCH --job-name=MALES-prototype
#SBATCH --output=MALES-prototype.out
#SBATCH --error=MALES-prototype.err
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=1G
#SBATCH --gpus-per-task=1
#SBATCH --account=research-AE-SPE

source /scratch/sciarella/.virtualenvs/males-blue/bin/activate

python Prototype_2.py 
