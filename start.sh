#!/bin/bash

for file in /fastqc/data/*.fastq.gz
do
	fastqc $file
done

exit
