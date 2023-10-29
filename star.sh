#!/bin/bash
#SBATCH --cpus-per-task=2 --mem-per-cpu=32g --ntasks=1
#SBATCH hetjob
#SBATCH --cpus-per-task=2 --mem-per-cpu=6g  --ntasks=8
#srun run.app
mkdir -p alignments

module load star

for file in /home/guduru.g/TASK_RNASEQ/results/trim/trimmed/*.fastq.gz ; do
    base=$(basename "$file" .fastq.gz)
    echo "Processing: $base"
    
    output_prefix="/home/guduru.g/TASK_RNASEQ/STAR/alignments/${base}_"
    
    /home/guduru.g/miniconda2/pkgs/star-2.5.2b-0/bin/STAR --runThreadN 24 --genomeDir /home/guduru.g/TASK_RNASEQ/STAR/index/M25  --readFilesCommand gunzip -c --readFilesIn "$file" --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts --outFileNamePrefix "$output_prefix"
done

echo "done!"

