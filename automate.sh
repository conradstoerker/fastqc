#!/bin/bash

#FILEPATH='/home/conrad/fastQC_docker/fastq_files/'
#if [ -d $1]; then
#	FILEPATH=$1
#fi

#the first installs if you don't have it, the second will update your current docker
echo Making sure you have the latest docker package...
#wget -qO- https://get.docker.com/ | sh
wget -N https://get.docker.com/ | sh


echo Restarting docker...  
service docker stop  
service docker start

#Must remove a preexisting container with the name we are going to use
docker rm -f fastqc

echo pulling conradstoerker/fastqc...
docker pull conradstoerker/fastqc

#The path should be changed to whatever directory contains the fastq files
echo running conradstoerker/fastqc...
#docker run --name fastqc -v $FILEPATH:/fastqc/data conradstoerker/fastqc
docker run --name fastqc -v '/home/conrad/fastQC_docker/fastq_files/':/fastqc/data conradstoerker/fastqc

#echo fastqc version:
#fastqc -v

echo exiting...
docker rm -f fastqc
#exit
 
