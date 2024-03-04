## Submit all the resnet for diferent ensembles
#sbatch --job-name=R50-E1 --output=slurm/R50-E1.out --error=slurm/R50-E1.err sub_protype.sh configuration.yaml
#sbatch --job-name=R50-E2 --output=slurm/R50-E2.out --error=slurm/R50-E2.err sub_protype.sh configuration_2.yaml
#sbatch --job-name=R50-E4 --output=slurm/R50-E4.out --error=slurm/R50-E4.err sub_protype.sh configuration_4.yaml
#sbatch --job-name=R50-E6 --output=slurm/R50-E6.out --error=slurm/R50-E6.err sub_protype.sh configuration_6.yaml
#
## Submit SCNNN C16 for diferent ensembles
#sbatch --job-name=SCNN-E1 --output=slurm/SCNN-E1.out --error=slurm/SCNN-E1.err sub_protype.sh configuration_C16.yaml
#sbatch --job-name=SCNN-E2 --output=slurm/SCNN-E2.out --error=slurm/SCNN-E2.err sub_protype.sh configuration_C16_2.yaml


## Submit SCNNN C8 for diferent ensembles
#sbatch --job-name=C8-E1 --output=slurm/C8-E1.out --error=slurm/C8-E1.err sub_protype.sh configuration_C8.yaml
#sbatch --job-name=C8-E2 --output=slurm/C8-E2.out --error=slurm/C8-E2.err sub_protype.sh configuration_C8_2.yaml
#sbatch --job-name=C8-E4 --output=slurm/C8-E4.out --error=slurm/C8-E4.err sub_protype.sh configuration_C8_4.yaml

# Submit SCNNN C16 for diferent ensembles
sbatch --job-name=C16-E1 --output=slurm/C16-E1.out --error=slurm/C16-E1.err sub_protype.sh configuration_C16.yaml
