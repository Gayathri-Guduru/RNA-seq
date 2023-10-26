#!/bin/bash
#SBATCH --job-name=star_index # Job name
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --time=120
#SBATCH --mem=40000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH --partition=production
#SBATCH --reservation=mrnaseq_workshop
#SBATCH --account=mrnaseq_workshop
#SBATCH --output=slurmout/star-index_%A.out # File to which STDOUT will be written
#SBATCH --error=slurmout/star-index_%A.err # File to which STDERR will be written
#SBATCH --mail-type=ALL

#outpath="References"
#mkdir -p ${outpath}

#cd ${outpath}

#wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/GRCm38.primary_assembly.genome.fa.gz
#unzip GRCm38.primary_assembly.genome.fa.gz
#chmod 777 GRCm38.primary_assembly.genome.fa

FASTA="/home/gayathri/RNA-seq/data/References/GRCm38.primary_assembly.genome.fa"

#wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gtf.gz
#gunzip gencode.vM25.annotation.gtf.gz
#chmod 777 gencode.vM25.annotation.gtf        

GTF="/home/gayathri/RNA-seq/data/References/gencode.vM25.annotation.gtf"

#mkdir star.overlap100.gencode.M25
#cd star.overlap100.gencode.M25

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir . --genomeFastaFiles ${FASTA} --sjdbGTFfile ${GTF} --sjdbOverhang 100
