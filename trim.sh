#!/bin/bash
#SBATCH --cpus-per-task=2 --mem-per-cpu=16g --ntasks=1
#SBATCH hetjob
#SBATCH --cpus-per-task=2 --mem-per-cpu=1g  --ntasks=8
#srun run.app
mkdir -p ../results/trim

module load trimmomatic 

for f in *_R1_001.fastq.gz # for each sample

do
    n=${f%%_R1_001.fastq.gz}
java -jar /shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2/trimmomatic.jar PE -threads 40 $1 /home/guduru.g/TASK_RNASEQ/QC_data/${n}_R1_001.fastq.gz /home/guduru.g/TASK_RNASEQ/QC_data/${n}_R2_001.fastq.gz /home/guduru.g/TASK_RNASEQ/results/trim/${n}_R1_trimmed.fastq.gz /home/guduru.g/TASK_RNASEQ/results/trim/${n}_R1_unpaired.fastq.gz /home/guduru.g/TASK_RNASEQ/results/trim/${n}_R2_trimmed.fastq.gz /home/guduru.g/TASK_RNASEQ/results/trim/${n}_R2_unpaired.fastq.gz ILLUMINACLIP:/shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

done
