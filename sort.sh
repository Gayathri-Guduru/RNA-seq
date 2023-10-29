#!/bin/bash
#SBATCH --cpus-per-task=2 --mem-per-cpu=32g --ntasks=1
#SBATCH hetjob
#SBATCH --cpus-per-task=2 --mem-per-cpu=6g  --ntasks=8

mkdir -p /home/guduru.g/TASK_RNASEQ/STAR/alignments/sorted_bam

for f in *.sortedByCoord.out.bam # for each sample

do
    n=${f%%.sortedByCoord.out.bam}
/home/guduru.g/TASK_RNASEQ/STAR/samtools-1.9/samtools sort -@ 16 -m 5G $f -o /home/guduru.g/TASK_RNASEQ/STAR/alignments/sorted_bam/${n}.sorted.bam --output-fmt BAM

done
