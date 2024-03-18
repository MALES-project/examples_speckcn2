
# Submit all the resnet for diferent ensembles
sbatch --job-name=R50-E1 --output=slurm/R50-E1.out --error=slurm/R50-E1.err sub_protype.sh configuration.yaml
sbatch --job-name=R50-E3 --output=slurm/R50-E3.out --error=slurm/R50-E3.err sub_protype.sh configuration_3.yaml

# Submit SCNNN C16 for diferent ensembles
sbatch --job-name=C16-E1 --output=slurm/C16-E1.out --error=slurm/C16-E1.err sub_protype.sh configuration_C16.yaml
sbatch --job-name=C16-E3 --output=slurm/C16-E3.out --error=slurm/C16-E3.err sub_protype.sh configuration_C16_3.yaml

# Submit SCNNN C8 for diferent ensembles
sbatch --job-name=C8-E1 --output=slurm/C8-E1.out --error=slurm/C8-E1.err sub_protype.sh configuration_C8.yaml
sbatch --job-name=C8-E3 --output=slurm/C8-E3.out --error=slurm/C8-E3.err sub_protype.sh configuration_C8_3.yaml

# Submit SCNNN C6 for diferent ensembles
sbatch --job-name=C6-E1 --output=slurm/C6-E1.out --error=slurm/C6-E1.err sub_protype.sh configuration_C6.yaml
sbatch --job-name=C6-E3 --output=slurm/C6-E3.out --error=slurm/C6-E3.err sub_protype.sh configuration_C6_3.yaml
