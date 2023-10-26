#!/bin/bash

# define variables
index= /home/gayathri/RNA-seq/data/References/

# get our data files
FILES= /home/gayathri/RNA-seq/trim/*_trimmed.fastq.gz

for f in $FILES
do
	echo $f
	base=$(basename $f .fastq.gz)
	echo $base
	STAR --runThreadN 8 --genomeDir $index --readFilesIn $f --outSAMtype BAM SortedByCoordinate
	--quantMode GeneCounts --readFilesCommand zcat --outFileNamePrefix $base"_"
	done
	
	echo "done!"
