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
ENV STARTFILE https://raw.githubusercontent.com/conradstoerker/fastqc/766a27e75dad17a0078a7b9931a9d81d82a46562/start.sh

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
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/${FASTQC_ZIP} /tmp/
RUN cd /usr/local ; unzip /tmp/${FASTQC_ZIP}
RUN chmod 755 /usr/local/FastQC/fastqc
RUN ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc



# Port to expose
EXPOSE 8888

#USER daemon

#Removing the tmp file
RUN rm /tmp/${FASTQC_ZIP}

CMD bash -C '/fastqc/start.sh';'bash'
