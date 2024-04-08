
# Submit all the resnet for diferent ensembles
#sbatch --job-name=R50-E1 --output=slurm/R50-E1.out --error=slurm/R50-E1.err sub_protype.sh configuration.yaml
#sbatch --job-name=R50-E3 --output=slurm/R50-E3.out --error=slurm/R50-E3.err sub_protype.sh configuration_3.yaml

# Submit SCNNN C16 for diferent ensembles
#sbatch --job-name=C16-E1 --output=slurm/C16-E1.out --error=slurm/C16-E1.err sub_protype.sh configuration_C16.yaml
#sbatch --job-name=C16-E3 --output=slurm/C16-E3.out --error=slurm/C16-E3.err sub_protype.sh configuration_C16_3.yaml

# Submit SCNNN C8 for diferent ensembles
#sbatch --job-name=C8-E1 --output=slurm/C8-E1.out --error=slurm/C8-E1.err sub_protype.sh configuration_C8.yaml
#sbatch --job-name=C8-E3 --output=slurm/C8-E3.out --error=slurm/C8-E3.err sub_protype.sh configuration_C8_3.yaml

# Submit SCNNN C6 for diferent ensembles
#sbatch --job-name=C6-E1 --output=slurm/C6-E1.out --error=slurm/C6-E1.err sub_protype.sh configuration_C6.yaml
#sbatch --job-name=C6-E3 --output=slurm/C6-E3.out --error=slurm/C6-E3.err sub_protype.sh configuration_C6_3.yaml

#sbatch --job-name=jandr-R50-E3 --output=slurm/jandr-R50-E3.out --error=slurm/jandr-R50-E3.err sub_protype.sh configurations/configuration_jr_3.yaml
#sbatch --job-name=jandr-C8-E3  --output=slurm/jandr-C8-E3.out  --error=slurm/jandr-C8-E3.err  sub_protype.sh configurations/configuration_jr_C8_3.yaml
#sbatch --job-name=j-R50-E3 --output=slurm/j-R50-E3.out --error=slurm/j-R50-E3.err sub_protype.sh configurations/configuration_j_3.yaml
#sbatch --job-name=j-C8-E3  --output=slurm/j-C8-E3.out  --error=slurm/j-C8-E3.err  sub_protype.sh configurations/configuration_j_C8_3.yaml
#sbatch --job-name=jmse-R50-E3 --output=slurm/jmse-R50-E3.out --error=slurm/jmse-R50-E3.err sub_protype.sh configurations/configuration_jmse_3.yaml
#sbatch --job-name=jmse-C8-E3  --output=slurm/jmse-C8-E3.out  --error=slurm/jmse-C8-E3.err  sub_protype.sh configurations/configuration_jmse_C8_3.yaml


#sbatch --job-name=jmse-R50-E1 --output=slurm/jmse-R50-E1.out --error=slurm/jmse-R50-E1.err sub_protype.sh configurations/configuration_jmse.yaml
#sbatch --job-name=jris-R50-E1 --output=slurm/jris-R50-E1.out --error=slurm/jris-R50-E1.err sub_protype.sh configurations/configuration_jris.yaml
#sbatch --job-name=jris-C6-E1 --output=slurm/jris-C6-E1.out --error=slurm/jris-C6-E1.err sub_protype.sh configurations/configuration_jris_C6.yaml

#sbatch --job-name=jmae-R50-E3 --output=slurm/jmae-R50-E3.out --error=slurm/jmae-R50-E3.err sub_protype.sh configurations/configuration_jmae_3.yaml
#sbatch --job-name=mse-R50-E3 --output=slurm/mse-R50-E3.out --error=slurm/mse-R50-E3.err sub_protype.sh configurations/configuration_mse_3.yaml
#sbatch --job-name=mse-R18-E3 --output=slurm/mse-R18-E3.out --error=slurm/mse-R18-E3.err sub_protype.sh configurations/configuration_mse_R18_3.yaml

#sbatch --job-name=jris-fC6-E3-r --output=slurm/fastC6-E3-r.out --error=slurm/fastC6-E3-r.err sub_protype.sh configurations/configuration_fastC6_r_3.yaml


#sbatch --job-name=jris-fC6-E3 --output=slurm/fastC6-E3.out --error=slurm/fastC6-E3.err sub_protype.sh configurations/configuration_fastC6_3.yaml
#sbatch --job-name=jris-fC6-A3 --output=slurm/fastC6-A3.out --error=slurm/fastC6-A3.err sub_protype.sh configurations/configuration_fastC6_av3.yaml
#sbatch --job-name=jris-fC6-E3-ris --output=slurm/fastC6-E3-ris.out --error=slurm/fastC6-E3-ris.err sub_protype.sh configurations/configuration_fastC6_ris_3.yaml
#sbatch --job-name=jris-fC6-A3-ris --output=slurm/fastC6-A3-ris.out --error=slurm/fastC6-A3-ris.err sub_protype.sh configurations/configuration_fastC6_av3_ris.yaml

sbatch --job-name=fC6-E3 --output=slurm/fastC6-E3.out --error=slurm/fastC6-E3.err sub_protype.sh configurations/configuration_fastC6_E3_smaller.yaml
sbatch --job-name=fC6-E3-r --output=slurm/fastC6-E3-r.out --error=slurm/fastC6-E3-r.err sub_protype.sh configurations/configuration_fastC6_E3_smaller_r.yaml
