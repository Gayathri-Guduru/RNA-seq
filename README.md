# RNA-seq: a step-by-step analysis pipeline
Data Analysis of RNA-Seq data
Programs required: it is recommended that the user has anaconda installed, through which all required programs can be installed. Assuming that anaconda is available, all the required programs can be installed using the following:

```
#Install the required programs using anaconda

conda install -c bioconda fastqc
conda install -c bioconda trimmomatic
conda install -c bioconda multiqc
conda install -c bioconda star
conda install -c bioconda samtools

#For differential expression using DESeq2
conda create DEseq2 r-essentials r-base

conda install DEseq2 -c bioconda bioconductor-deseq2 
conda install DEseq2 -c r r-ggplot2 
```

## Introduction
This pipeline is compatabile with RNA-seq reads generated by Illumina.

## Pre-alignment QC
Generate QC report

The raw sequence data should first be assessed for quality. FastQC reports can be generated for all samples to assess sequence quality, GC content, duplication rates, length distribution, K-mer content and adapter contamination. For paired-end reads, run fastqc on both files, with the results output to the current directory:

```
fastqc *.fastq.gz -o /path/to/results/dir # Fastqc on 8 samples of RNA-Seq data
```

Trimming

Trimming is a useful step of pre-alignment QC, which removes low quality reads and contaminating adapter sequences (which occur when the length of DNA sequences is longer than the DNA insert).

If there is evidence of adapter contamination shown in the fastQC report (see below), specific adapter sequences can be trimmed. Here, the program fastp is used to trim the data. For paired-end data:
run fastqc on all the rnaseq fastq files.....


mkdir References
cd References
install mouse genome for indexing

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/GRCm38.primary_assembly.genome.fa.gz
gunzip GRCm38.primary_assembly.genome.fa.gz

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gtf.gz
gunzip gencode.vM25.annotation.gtf.gz

chmod 777 *

cd ..
mkdir index                                                    
STAR --runThreadN 8 --runMode genomeGenerate --genomeDir /home/gayathri/RNA-seq/data/index --genomeFastaFiles /home/gayathri/RNA-seq/data/References/GRCm38.primary_assembly.genome.fa --sjdbGTFfile /home/gayathri/RNA-seq/data/References/gencode.vM25.annotation.gtf --sjdbOverhang 100

