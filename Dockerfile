############################################################
# Dockerfile to build FASTQC container images
# Begins with the start.sh script which is designed to send all the files from the volume through fastqc
# Based on Ubuntu
#
############################################################
# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER conrad stoerker

# this is used as a placeholder so the file name doesn't need to be changed everywhere
ENV FASTQC_PATH http://www.bioinformatics.babraham.ac.uk/projects/fastqc
ENV FASTQC_ZIP fastqc_v0.11.3.zip
ENV STARTFILE https://raw.githubusercontent.com/conradstoerker/fastqc/master/start.sh

# Creating directories to use
RUN mkdir /fastqc
RUN mkdir /fastqc/data
VOLUME /fastqc/data

# Update the repository sources list
RUN apt-get update

# Install tools
RUN apt-get install --yes openjdk-7-jre-headless unzip

# Download the start.sh file
ADD ${STARTFILE} /fastqc/

# Download and Install FastQC
ADD ${FASTQC_PATH}/${FASTQC_ZIP} /tmp/
RUN cd /usr/local ; unzip /tmp/${FASTQC_ZIP}
RUN chmod 755 /usr/local/FastQC/fastqc
RUN ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc

#Removing the tmp file
RUN rm /tmp/${FASTQC_ZIP}

#Running the start.sh script
CMD bash -C '/fastqc/start.sh';'bash'
