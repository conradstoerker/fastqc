#!/bin/bash

FILEPATH='/home/conrad/fastQC_docker/fastq_files/'
if [ -d "$1"]; then
	FILEPATH="$1"
fi
	
echo Restarting docker...  
sudo service docker stop  
sudo service docker start

#Must remove a preexisting container with the name we are going to use
#sudo docker rm -f fastqc

echo pulling conradstoerker/fastqc...
sudo docker pull conradstoerker/fastqc

echo running conradstoerker/fastqc...
sudo docker run --name fastqc -v $FILEPATH:/fastqc/data conradstoerker/fastqc

#echo fastqc version:
#fastqc -v

echo exiting...
sudo docker rm fastqc
#exit
 
