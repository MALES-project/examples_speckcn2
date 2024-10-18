#sbatch   --job-name=R50     --output=slurm/R50.out     --error=slurm/R50.err     sub_train_and_post.sh   configurations/configuration_ResNet50.yaml
#sbatch   --job-name=R18     --output=slurm/R18.out     --error=slurm/R18.err     sub_train_and_post.sh   configurations/configuration_ResNet18.yaml
#sbatch   --job-name=C4      --output=slurm/C4.out      --error=slurm/C4.err      sub_train_and_post.sh   configurations/configuration_C4.yaml
#sbatch   --job-name=h-R50   --output=slurm/h-R50.out   --error=slurm/h-R50.err   sub_train_and_post.sh   configurations/configuration_ResNet50_hard.yaml
#sbatch   --job-name=h-R18   --output=slurm/h-R18.out   --error=slurm/h-R18.err   sub_train_and_post.sh   configurations/configuration_ResNet18_hard.yaml
#sbatch   --job-name=h-C4    --output=slurm/h-C4.out    --error=slurm/h-C4.err    sub_train_and_post.sh   configurations/configuration_C4_hard.yaml
#sbatch   --job-name=R152    --output=slurm/R152.out    --error=slurm/R152.err    sub_train_and_post.sh   configurations/configuration_ResNet152.yaml

sbatch   --job-name=hs-R50   --output=slurm/hs-R50.out   --error=slurm/hs-R50.err   sub_train_and_post.sh   configurations/configuration_ResNet50_hsym.yaml
