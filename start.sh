#!/bin/bash


for file in /fastqc/data/*.fastq
do
	fastqc $file
done

exit
