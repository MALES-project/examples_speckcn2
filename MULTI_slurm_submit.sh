
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

#sbatch --job-name=fC6-E3 --output=slurm/fastC6-E3.out --error=slurm/fastC6-E3.err sub_protype.sh configurations/configuration_fastC6_E3_smaller.yaml
#sbatch --job-name=fC6-E3-r --output=slurm/fastC6-E3-r.out --error=slurm/fastC6-E3-r.err sub_protype.sh configurations/configuration_fastC6_E3_smaller_r.yaml




#sbatch --job-name=C6-E3 --output=slurm/C6-E3.out --error=slurm/C6-E3.err sub_protype.sh configurations/configuration_C6_E3.yaml
#sbatch --job-name=C6-E3-r --output=slurm/C6-E3-r.out --error=slurm/C6-E3-r.err sub_protype.sh configurations/configuration_C6_E3_r.yaml

#sbatch --job-name=C6-E1 --output=slurm/C6-E1.out --error=slurm/C6-E1.err sub_protype.sh configurations/configuration_C6_E1.yaml
#sbatch --job-name=C6-E1-r --output=slurm/C6-E1-r.out --error=slurm/C6-E1-r.err sub_protype.sh configurations/configuration_C6_E1_r.yaml

#sbatch --job-name=C6-E4 --output=slurm/C6-E4.out --error=slurm/C6-E4.err sub_protype.sh configurations/configuration_C6_E4.yaml
#sbatch --job-name=C6-E4-r --output=slurm/C6-E4-r.out --error=slurm/C6-E4-r.err sub_protype.sh configurations/configuration_C6_E4_r.yaml

#sbatch --job-name=C6-E4-r-mae --output=slurm/C6-E4-r.out --error=slurm/C6-E4-r.err sub_protype.sh configurations/configuration_C6_E4_r-mae.yaml

#sbatch --job-name=C6-E3-r-mae --output=slurm/C6-E3-r-mae.out --error=slurm/C6-E3-r-mae.err sub_protype.sh configurations/configuration_C6_E3_r-mae.yaml
#sbatch --job-name=C6-E6-r-mae --output=slurm/C6-E6-r-mae.out --error=slurm/C6-E6-r-mae.err sub_protype.sh configurations/configuration_C6_E6_r-mae.yaml


#sbatch --job-name=C6-E1-noise --output=slurm/C6-E1-noise.out --error=slurm/C6-E1-noise.err sub_protype.sh configurations/configuration_C6_E1_r.yaml
#sbatch --job-name=C6-E3-noise --output=slurm/C6-E3-noise.out --error=slurm/C6-E3-noise.err sub_protype.sh configurations/configuration_C6_E3_r.yaml
#sbatch --job-name=C6-E4-noise --output=slurm/C6-E4-noise.out --error=slurm/C6-E4-noise.err sub_protype.sh configurations/configuration_C6_E4_r.yaml
#sbatch --job-name=C6-E6-noise --output=slurm/C6-E6-noise.out --error=slurm/C6-E6-noise.err sub_protype.sh configurations/configuration_C6_E6_r.yaml


#sbatch --job-name=C6-E1-noise --output=slurm/C6-E1-noise.out --error=slurm/C6-E1-noise.err sub_protype.sh configurations/configuration_C6_E1_r.yaml
#sbatch --job-name=C16-E1-noise --output=slurm/C16-E1-noise.out --error=slurm/C16-E1-noise.err sub_protype.sh configurations/configuration_C16_E1_r.yaml
#sbatch --job-name=C6-E1-noise-Jonly --output=slurm/C6-E1-noise-Jonly.out --error=slurm/C6-E1-noise-Jonly.err sub_protype.sh configurations/configuration_C6_E1_Jonly.yaml
#sbatch --job-name=C6-E1-noise-ronly --output=slurm/C6-E1-noise-ronly.out --error=slurm/C6-E1-noise-ronly.err sub_protype.sh configurations/configuration_C6_E1_ronly.yaml

#sbatch --job-name=C6-E1-noise-noSig --output=slurm/C6-E1-noise-noSig.out --error=slurm/C6-E1-noise-noSig.err sub_protype.sh configurations/configuration_C6_E1_noSig.yaml
#sbatch --job-name=C6-E1-noise-noSig-oneDrop --output=slurm/C6-E1-noise-noSig-oneDrop.out --error=slurm/C6-E1-noise-noSig-oneDrop.err sub_protype.sh configurations/configuration_C6_E1_noSig_oneDrop.yaml

#sbatch --job-name=R18 --output=slurm/R18.out --error=slurm/R18.err sub_protype.sh configurations/configuration_ResNet18.yaml
#sbatch --job-name=C6 --output=slurm/C6.out --error=slurm/C6.err sub_protype.sh configurations/configuration_C6.yaml

#sbatch --job-name=R18-v2 --output=slurm/R18-v2.out --error=slurm/R18-v2.err sub_protype.sh configurations/configuration_ResNet18_v2.yaml
sbatch --job-name=R18-v3 --output=slurm/R18-v3.out --error=slurm/R18-v3.err sub_protype.sh configurations/configuration_ResNet18_v3.yaml
