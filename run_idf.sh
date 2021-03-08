#!/bin/bash
#SBATCH --job-name=idf
#SBATCH --ntasks=1
#SBATCH --mem=32768
#SBATCH --time=6:00:00
#SBATCH --tmp=9G
#SBATCH --partition=normal
#SBATCH --qos=gpu
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cr.silper@gmail.com

source /etc/profile.d/modules.sh
cd ~/proyecto_grado/idf/integer_discrete_flows/
source ~/miniconda3/bin/activate
conda activate idf
python main_experiment.py --n_flows 8 --n_levels 3 --n_channels 512 --coupling_type 'densenet' --densenet_depth 12 --n_mixtures 5 --splitprior_type 'densenet'

