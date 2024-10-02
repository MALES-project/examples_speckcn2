#!/bin/sh

#SBATCH --job-name=MALES-speckcn2
#SBATCH --output=slurm/speckcn2.out
#SBATCH --error=slurm/speckcn2.err
#SBATCH --partition=gpu-a100-small
# You can use the partition gpu-a100-small for <24h jobs, for longer use gpu
#SBATCH --time=20:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6G
#SBATCH --gpus-per-task=1
#SBATCH --account=research-AE-SPE

module load 2023r1
module load python/3.9.8
module load py-pip

python example_train.py $1
python example_post.py $1
