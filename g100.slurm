#!/bin/bash

#SBATCH --job-name=LTER-AA
#SBATCH -N 1 -n 1
#SBATCH --time=01:00:00
#SBATCH --mem=10gb
#SBATCH --account=OGS23_PRACE_IT
#SBATCH --partition=g100_usr_prod
###SBATCH --qos=g100_qos_dbg
###SBATCH --nodes=2

####module load vtune/oneapi-2022
cd $SLURM_SUBMIT_DIR

####conda activate seamless-bb-r
export LD_LIBRARY_PATH=/g100/home/userexternal/ealvarez/.conda/envs/seamless-bb-r/lib:$LD_LIBRARY_PATH
export PATH=$PATH:$HOME/.local/bin

date
###perf record -g ./gotm.xx
###vtune -collect hotspots --target-duration-type veryshort ./gotm.xx
./gotm.xx 
date
