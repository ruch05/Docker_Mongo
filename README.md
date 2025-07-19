

# 🚀 Learning Docker by Implementing a New Project

Learning Docker by implementing a new project where a Node.js app is connected to the Docker image of Mongo and MongoDB Express on a common network with a Docker Compose file, and is run to use the database for adding and displaying user accounts info.

---

Here in this repo, there is an app `testapp` based on Node.js and the Docker Compose file named as `mongo.yaml` which creates the Docker images for MongoDB and Mongo Express. Then there is a Dockerfile where the app `testapp` is dockerized.

---

## 🧠 The commands learnt in this project are:

```bash
docker run -it ubuntu

docker pull hello-world
docker run hello-world
docker pull image_name
docker images
docker rmi image_name
```

```bash
docker run -d -e ENV_VAR=VAR_VALUE --name CUSTOM_NAME -p8080:8080 image_name 
```

* `-d` means detached mode
* `-e` means env variables
* `--name` is the tag when you want to name the container
* `-p` is to bind the ports of server with the container/image port

**Example:**

```bash
docker run -d -e MYSQL_ROOT_PASSWORD=secret --name mysql_latest -p8080:3306 mysql
```

* `MYSQL_ROOT_PASSWORD` is a mandatory env variable that we need to set — we know this from the documentation of the image (`mysql` in this case)
* `3306` is the port that SQL listens on, again mentioned in the MySQL image documentation on Docker Hub

---

```bash
docker exec -it container_name /bin/bash
```

* `exec` executes the command that is passed after the container name
* `-it` means interactive mode

**Example:**

```bash
docker exec -it mysql_latest /bin/bash
```

---

```bash
docker login
docker ps
docker ps -a
docker start container_name
docker stop container_name
docker rm container_name
docker logs container_name
```

---

```bash
docker exec -it container_name /bin/bash
```

* `exec` executes the command that is passed after the container name
* `-it` means interactive mode

---

```bash
docker network ls
docker network inspect network_name
docker network rm network_name
```

---

## 🧩 Docker Compose

Docker Compose is a tool through which you write a file where you configure multiple containers and their settings so that all the containers are run just by running this one file.
No need to run multiple containers manually and set configs manually.
This also makes the process of editing the configuration like names, env variable, etc for a container super easy.

**MAIN ADVANTAGE**: All containers run on the **same network** which are present in one Docker file.
 In this project, you can check the `mongo.yaml` file to see how this file looks.

⚠️ **BE AWARE OF CORRECT YAML FORMAT**

```bash
docker compose -f mongodb.yaml up -d
```

* `-f` means file that needs to be run
* `up` is the main command to start running the file

```bash
docker compose -f mongodb.yaml down
```

* `down` command is to stop and delete the running containers

---

## 📦 Dockerfile

Dockerfile is a file with which you can containerize your apps.
Not just containerize your app but also its dependencies.

```dockerfile
FROM node            # FROM means which base layer you want to use for your app
WORKDIR path         # WORKDIR means the working directory that you need to set from which these following commands in dockerfile run. It´s like running "cd" in a shell : it tells Docker that “From here on, assume we’re inside this folder.”
ENV key=value        # ENV means environment variables that you pass with docker run cmds usually to run the container of an image
RUN cmd              # RUN runs the following command that you specify, for example RUN mkdir testapp
COPY src dest        # COPY copies the source to destination
CMD ["x", "y"]       # CMD runs the command 'x y'. For ex: CMD ["node", "/testapp/server.js"] runs "node /testapp/server.js". This can only be used once. RUN command can be placed multiple times in the dockerfile but there can only be one CMD command.
EXPOSE port_number   # EXPOSE will expose the app on the given port number
```

---

### ✅ A sample Dockerfile:

```dockerfile
FROM node

ENV MONGO_DB_USERNAME=admin
ENV MONGO_DB_PWD=qwerty
ENV MONGO_HOST=mongo

RUN mkdir -p testapp

COPY . /testapp

CMD ["node", "/testapp/server.js"]
```

---

### 🛠️ Build the image:

```bash
docker build -t testapp:1.0 dockerfile_dir
```

* `-t` means tag where we can provide the version of our project/image also
* `dockerfile_dir` is the directory where the Dockerfile exists

**Example:**

```bash
docker build -t testapp:1.0 .
```

This builds the image: `testapp:1.0`

Now you can give this image to your teammates who can then use your app simply by running a container from this image:

```bash
docker run -p5050:5050 --network docker-testapp_default testapp:1.0
```

* `-p` binds the port 5050 of the app with our server port
* `--network` needs to be given here because we need to connect MongoDB which runs from Docker Compose YAML file, which creates a network interface — and that network interface needs to be same for our app so our app can connect with MongoDB

---

## 🔜 In the next project…

I'll polish this project and use a Docker Compose file to run my app as well.

