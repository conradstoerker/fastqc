Assuming that docker is running in ubuntu. 
Sometimes sudo is needed, change directory names as necessary

#Build a new docker image for fastqc using the Dockerfile from your current directory

	docker build -t name/fastqc .
	
	docker build -t conradstoerker/fastqc .

	
#Run the fastqc image as an interactive container:

	-v sets the directory, volume, to be used, -v host_dir:container_dir
	-i sets the container to be interactive
	--name indicates the name, --name choose_name

	docker run --name choose_name -i -v host_dir:container_dir image_name

	docker run --name fastqc -i -v '/home/conrad/fastQC_docker/fastq_files/':/fastqc/data conradstoerker/fastqc

	typing "exit" will bring you back to the terminal


once the container has been run once, run it again by typing

	docker start -i container_name
	
to remove the container, only works if the container has stopped

	docker rm container_name

to remove the image, use -f if there are dependencies that you don't care about

	docker rmi image_name
	

to run fastq simply type

	fastq container_dir/fastq_file


#Pulling and pushing the docker image to/from the docker hub:

	docker pull conradstoerker/fastqc
	docker push conradstoerker/fastqc
