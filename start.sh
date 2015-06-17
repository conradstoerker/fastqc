#!/bin/bash


for file in /fastqc/data/*.fastq
do
	fastqc --with-failed-reads $file
done

for file in /fastqc/data/*.fastq.gz
do
	fastqc --with-failed-reads $file
done

exit
