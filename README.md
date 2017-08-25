# MongoDB Docker Image

Dockerfile for the VersionEye MongoDB Docker image. The image can be build like this:

```
docker build -t versioneye/mongodb:3.4.6 .
```

It can be executed likes this: 

```
docker run --name mongodb --restart=always -v /mnt/mongodb:/data -p 27017:27017 -p 28017:28017 -d versioneye/mongodb:3.4.6
```

With the command above, the Docker container will be started and the directory `/mnt/mongodb` from the host system will be mounted into the running Docker container to `/data`. That way the data stays persistent on the host, even if the Docker container is stopped, crashed or exited. 
