#!/bin/bash
#SBATCH --cpus-per-task=2 --mem-per-cpu=32g --ntasks=1
#SBATCH hetjob
#SBATCH --cpus-per-task=2 --mem-per-cpu=6g  --ntasks=8


for f in *_Aligned.sorted.bam # for each sample

do
    n=${f%%_Aligned.sorted.bam}
/home/guduru.g/TASK_RNASEQ/STAR/samtools-1.9/samtools index -@ 16 -m 14 $f ${n}.sorted.bai

done
