#!/bin/bash
#SBATCH --job-name=idf_imagenet32
#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --time=6:00:00
#SBATCH --partition=normal
#SBATCH --qos=gpu
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@email
#SBATCH --output=%x_%j.out

source /etc/profile.d/modules.sh
cd ~/proyecto_grado/idf/integer_discrete_flows/
source $CONDA_ACTIVATE
conda activate idf

python main_experiment.py --evaluate_interval_epochs 5 --n_flows 8 --n_levels 3 --n_channels 512 --n_mixtures 5 --densenet_depth 12 --coupling_type 'densenet' --splitprior_type 'densenet' --dataset 'ima' --epochs 100 --lr_decay 0.99
