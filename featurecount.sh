#!/bin/bash

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gtf.gz
gunzip gencode.vM25.annotation.gtf.gz

/home/guduru.g/TASK_RNASEQ/STAR/alignments/sorted_bam/subread-2.0.2-Linux-x86_64/bin/featureCounts -T 40 --countReadPairs -t exon -g gene_id -a gencode.vM25.annotation.gtf -o counts.txt *.bam
