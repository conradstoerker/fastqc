echo Restarting docker...  
sudo service docker stop  
sudo service docker start

echo pulling conradstoerker/fastqc...
sudo docker pull conradstoerker/fastqc

echo running conradstoerker/fastqc...
docker run --name fastqc -i -v '/home/conrad/fastQC_docker/fastq_files/':/fastqc/data conradstoerker/fastqc

echo fastqc version:
fastqc -v

echo exiting...
exit
