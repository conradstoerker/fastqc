#!/bin/bash

KMERS=$1

for file in /fastqc/data/*.fastq
do
	fastqc -k $KMERS $file
done

for file in /fastqc/data/*.fastq.gz
do
	fastqc -k $KMERS $file
done

exit
