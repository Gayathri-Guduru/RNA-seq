#!/bin/bash
#SBATCH -fastqc
#SBATCH -N1 --ntasks-per-node=4
#SBATCH -t2
#SBATCH -qinferno
#SBATCH -oReport-%j.out

cd $SLURM_SUBMIT_DIR
mkdir -p ../results
mkdir -p ../results/fastqc

module load fastqc
fastqc *.fastq.gz -o /home/guduru.g/TASK_RNASEQ/results/fastqc
