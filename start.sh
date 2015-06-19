#!/bin/bash

#Assumes there is a file with the number of kmers to use in the same directory as the fastq files
mers="/fastqc/data/kmers.txt"
KMERS=$(egrep -o '[2-9]+' $mers | egrep -c '^1')

for file in /fastqc/data/*.fastq
do
	fastqc -k $KMERS $file
done

for file in /fastqc/data/*.fastq.gz
do
	fastqc -k $KMERS $file
done

exit
