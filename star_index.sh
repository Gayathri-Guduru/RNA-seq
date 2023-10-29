#!/bin/bash                                                                                                                                                                                                        #SBATCH --cpus-per-task=2 --mem-per-cpu=16g --ntasks=1                                                                                                                                                             #SBATCH hetjob                                                                                                                                                                                                     #SBATCH --cpus-per-task=2 --mem-per-cpu=1g  --ntasks=8                                                                                                                                                             #srun run.app

outpath="References"
mkdir -p ${outpath}

cd ${outpath}

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/GRCm38.primary_assembly.genome.fa.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gtf.gz

gunzip GRCm38.primary_assembly.genome.fa.gz
gunzip gencode.vM25.annotation.gtf.gz

FASTA="/home/guduru.g/TASK_RNASEQ/STAR/References/GRCm38.primary_assembly.genome.fa"
GTF="/home/guduru.g/TASK_RNASEQ/STAR/References/gencode.vM25.annotation.gtf"

cd ..

mkdir -p index
mkdir index/M25

module load star

/home/guduru.g/miniconda2/pkgs/star-2.5.2b-0/bin/STAR --runThreadN 16 --runMode genomeGenerate --genomeDir /home/guduru.g/TASK_RNASEQ/STAR/index/M25 --genomeFastaFiles ${FASTA} --sjdbGTFfile ${GTF} --sjdbOverhang 50
