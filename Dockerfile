############################################################
# Dockerfile to build FASTQC container images
# Based on Ubuntu
#
#
#	docker build -t conradstoerker/fastqc .
#
#	docker run --name fqc -i conradstoerker/fastqc
#
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER conrad stoerker

# if the file name changes in the future
ENV FASTQC_ZIP fastqc_v0.11.3.zip

# Update the repository sources list
RUN apt-get update

# Install tools
#RUN apt-get install -y python-pip
RUN apt-get install --yes openjdk-7-jre-headless perl unzip

# Download FastQC and Install FastQC
#RUN apt-get install -y fastqc
#RUN rm -rf /var/lib/apt/lists/*

# Download and Install FastQC
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/${FASTQC_ZIP} /tmp/
RUN cd /usr/local ; unzip /tmp/fastqc_*.zip
RUN chmod 755 /usr/local/FastQC/fastqc
RUN ln -s /usr/local/FastQC/fastqc /usr/local/bin/fastqc


#RUN mkdir /fastqc
#RUN mkdir /fastqc/data
#VOLUME /fastqc/data

###Different way to install fastqc
#RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/${FASTQC_ZIP} \
#	&& unzip ${FASTQC_ZIP} \
#	&& rm ${FASTQC_ZIP}

# Port to expose
EXPOSE 8888


# Adding the files for fastqc
#ADD /home/fastQC_docker/numbers.txt /home

# Running fastQC maybe?
#ENV inputFile param1
#ENV outputFile param2
#RUN fastqc ${inputFile} ${outputFile}



#USER daemon

#CMD ["/fastqc/FastQC/fastqc"] 
#CMD ["bash"]

#ENTRYPOINT fastqc param1 param2



# Cleanup
RUN rm -rf /tmp/fastqc_*.zip
