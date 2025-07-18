
Learning docker by implementing a new project where a node.js app is connected to the docker image of mongo and mongodb express on a common network with docker compose file and is run to use the database for adding and displaying user accounts info.

Here in this repo, there is an app 'testapp' based on node.js and the docker compose file named as mongo.yaml which creates the docker images for mongodb and mongo-express. Then there is a dockerfile where the app 'testapp' is dockerized.

The commands learnt in this project are:

docker run -it ubuntu

docker pull hello-world
docker run hello-world
docker pull image_name
docker images
docker rmi image_name


docker run -d -e ENV_VAR=VAR_VALUE --name CUSTOM_NAME -p8080:8080 image_name 
# -d means detached mode, -e means env variables, --name is the tag when you want to name the container, -p is to bind the ports of server with the container/image port
# Example: docker run -d -e MYSQL_ROOT_PASSWORD=secret --name mysql_latest -p8080:3306 mysql
# MYSQL_ROOT_PASSWORD is mandatory env variable that we need to set - we know this from documentation of an image, 'mysql' in this case
# Here 3306 is the port that sql listens on, again, which is mentioned in mysql image documentation on docker hub


docker exec -it container_name /bin/bash
#exec executes the command that is passed after the container_name; -it means interactive mode
# Example: docker exec -it mysql_latest /bin/bash


docker login
docker ps
docker ps -a
docker start container_name
docker stop container_name
docker rm container_name
docker logs container_name
docker exec -it container_name /bin/bash
#exec executes the command that is passed after the container_name; -it means interactive mode


docker network ls
docker network inspect network_name
docker network rm network_name

Docker Compose is a tool through which you write a file where you configure multiple containers and their settings so that all the containers are run just by running this one file. No need to run multiple containers manually and set configs manually. This also makes the process of editing the configuration like names, env variable, etc for a container super easy. 
MAIN ADVANTAGE is all containers run on the same network which are present in one docker file.
In this project, you can check 'mongo.yaml' file to see how this file looks.
BE AWARE OF CORRECT YAML FORMAT

docker compose -f mongodb.yaml up -d  # -f means file that needs to be run; up is the main command to start running the file
docker compose -f mongodb.yaml down # down command is to stop and delete the running containers

DOCKERFILE
Now, Dockerfile is a file with which you can containerize your apps.

