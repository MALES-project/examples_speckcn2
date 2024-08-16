sbatch --job-name=R18 --output=slurm/R18.out --error=slurm/R18.err sub_protype.sh configurations/configuration_ResNet18.yaml
sbatch --job-name=C6 --output=slurm/C6.out --error=slurm/C6.err sub_protype.sh configurations/configuration_C6.yaml
