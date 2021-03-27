#!/bin/bash
#SBATCH --job-name=idf_cifar10
#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --time=6:00:00
#SBATCH --partition=normal
#SBATCH --qos=gpu
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@email
#SBATCH --output=%x_%j.out
#SBATCH --nodes=2

source /etc/profile.d/modules.sh
cd ~/proyecto_grado/idf/integer_discrete_flows/
source ~/anaconda/bin/activate
conda activate idf

python main_experiment.py --batch_size 32 --n_flows 8 --n_levels 3 --n_channels 512 --coupling_type 'densenet' --densenet_depth 12 --n_mixtures 5 --splitprior_type 'densenet'

