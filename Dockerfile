############################################################
# Dockerfile to build FASTQC container images
# Based on Ubuntu
#
#
#	docker build -t conradstoerker/fastqc .
#
#	
#
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER conrad stoerker

# this is used as a placeholder so the file name doesn't need to be changed everywhere
ENV FASTQC_ZIP fastqc_v0.11.3.zip

# Update the repository sources list
RUN apt-get update

# Install tools
RUN apt-get install --yes openjdk-7-jre-headless perl unzip


# Download and Install FastQC
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/${FASTQC_ZIP} /tmp/
RUN cd /usr/local ; unzip /tmp/fastqc_*.zip
RUN chmod 755 /usr/local/FastQC/fastqc
RUN ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc

# Creating directories to use
RUN mkdir /fastqc
RUN mkdir /fastqc/data
VOLUME /fastqc/data

# Port to expose
EXPOSE 8888

#USER daemon

#Removing the tmp folder
RUN rm /tmp/${FASTQC_ZIP}

