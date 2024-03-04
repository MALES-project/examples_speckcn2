#!/bin/sh

#SBATCH --job-name=MALES-speckcn2
#SBATCH --output=slurm/speckcn2.out
#SBATCH --error=slurm/speckcn2.err
#SBATCH --partition=gpu
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2G
#SBATCH --gpus-per-task=1
#SBATCH --account=research-AE-SPE

module load 2023r1
module load python/3.9.8
module load py-pip

python Prototype.py $1
