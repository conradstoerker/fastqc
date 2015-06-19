#!/bin/bash

file in /fastqc/data/kmer.txt
KMERS= read $file

for file in /fastqc/data/*.fastq
do
	fastqc -k $KMERS $file
done

for file in /fastqc/data/*.fastq.gz
do
	fastqc -k $KMERS $file
done

exit
