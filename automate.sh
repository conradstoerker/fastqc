#!/bin/bash

#The FILEPATH should be changed to whatever directory contains the fastq files
#FILEPATH is the path on your computer, DOCKERPATH is the path in the container
FILEPATH='/home/conrad/fastQC_docker/fastq_files/'
DOCKERPATH='/fastqc/data conradstoerker/fastqc'

#Container and Image names
CNAME='fastqc'
IMGNAME='conradstoerker/fastqc'

#Searching for parameters, not currently working
#if [ -d $1]; then
#	FILEPATH=$1
#fi

#the first wget installs if you don't have it, the second will update your current docker
echo Making sure you have the latest docker package...
#wget -qO- https://get.docker.com/ | sh
#sudo usermod -aG docker [your_user]
wget -N https://get.docker.com/ | sh

echo Restarting docker...  
sudo service docker stop  
sudo service docker start

#Remove a preexisting container with the name we are going to use if it exists, not necessary because at the end it is removed
#sudo docker rm -f $CNAME

echo pulling $IMGNAME...
sudo docker pull $IMGNAME

echo running $IMGNAME...
sudo docker run --name $CNAME -v $FILEPATH:$DOCKERPATH $IMGNAME

echo removing the container and exiting...
sudo docker rm -f $CNAME
