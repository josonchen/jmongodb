########
# Dockerfile for MongoDB container images
# Base on Ubuntu
#######

# Set the base images to Ubuntu
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER joson taijiquan@hotmail.com

# Update the repository sources list
RUN apt-get update

##### BEGIN INSTALLATION
# Install MongoDB Following the Instructions at MongoDB Docs
# Ref:  https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb-community-edition-on-ubuntu


# Add the package verification key,mport the public key used by the package management system
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
	
# Add MongoDB to the repository sources list, Create a list file for MongoDB.
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list
	
# Update the repository sources list once more
RUN apt-get update
	
# Install MongoDB package (Install the latest stable version of MongoDB)
RUN apt-get install -y mongodb-org

# Create the default data directory
RUN mkdir -p /data/db

# Expose the default port
EXPOSE 27017

# Default port to execture the entrypoint (MongoDB)
CMD ["--port 27017"]

# Set default container command
ENTRYPOINT usr/bin/mongod

