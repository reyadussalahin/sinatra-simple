<!-- [![Build Status](https://img.shields.io/circleci/build/gh/reyadussalahin/sinatra-simple/main?style=flat-square)](https://circleci.com/gh/reyadussalahin/sinatra-simple/tree/master) -->
[![Stars](https://img.shields.io/github/stars/reyadussalahin/sinatra-simple?style=flat-square)](https://github.com/reyadussalahin/sinatra-simple/stargazers)
[![Forks](https://img.shields.io/github/forks/reyadussalahin/sinatra-simple?style=flat-square&color=purple)](https://github.com/reyadussalahin/sinatra-simple/network/members)
[![Issues](https://img.shields.io/github/issues/reyadussalahin/sinatra-simple?style=flat-square&color=blue)](https://github.com/reyadussalahin/sinatra-simple/issues)
[![License](https://img.shields.io/github/license/reyadussalahin/sinatra-simple?color=teal&style=flat-square)](https://github.com/reyadussalahin/sinatra-simple/blob/master/LICENSE)

# Sinatra Simple
Sinatra simple is built to provide a simple configured development environment to get started with ruby sinatra web framework fast and efficently. It also comes with dockerfile that may come in handy when one wants to deploy docker images to production or may be use docker images for serving application in development.

## Getting started
### Prerequsites
I assume, you've `ruby` preinstalled.

### Get sinatra-simple
First get sinatra simple repository using the following command:
```bash
$ git clone https://github.com/reyadussalahin/sinatra-simple.git <your-webapp>
$ cd <your-webapp>
```

### Create development environment
```bash
# install bundler
$ gem install bundler
# now, install gems listed in Gemfiles
$ bundle install
```

### Run development server
```bash
$ rerun "rackup -o 0.0.0.0 -p 8000"
```
check your web app by entering the url `127.0.0.1:8000`

### Run production server
To use in production you may want to choose `puma` as your server rather than using builtin `webrick` server. After installing you can run your production server as follows:
```bash
$ rackup -s puma -o 0.0.0.0 -p 8000
```

## Docker based development and deployment
Before following the steps below, you must perform the two steps from getting started section:
 - [Create development environment](#create-development-environment)
 - [Get sinatra-simple](#get-sinatra-simple)

after performing these two steps:

### Prerequisites
I assume that, you've docker installed in your machine.

### Creating docker image
Create a docker image using the following command:
```bash
$ docker build --tag=<app-image-tag> .
```
Now you can use the image as both development container and production use.

### Docker container as development environment
Run the following command to start web server for development env:
```bash
$ docker run --name=<app-container-dev> -v $PWD:/App -v /App/.bundle -p 127.0.0.1:8000:80 -dit <app-image-tag> rerun "rackup -o 0.0.0.0 -p 8000"
```
This will create a volume mounting your project directory as `/App` inside docker container. So, any changes made in your current directory i.e. project root will be visible inside container `<app-container-dev>`.


### Docker container for production
After you're done with all the features and fixes, run docker build command again:
```bash
$ docker build --tag=<app-image-new-tag> .
```
Now, psuh the container to docker hub or your selected docker registry using the following command
```bash
$ docker push <app-image-new-tag>
```

Now, you can pull the docker image from any cloud server and start it using the following command as follows:
```bash
$ docker pull <app-image-new-tag>
$ docker run --name=<app-container-production> -p <host>:<port>:80 <app-image-new-tag>
```

Voila! you're done deploying your first sinatra app in production using docker conatiner!

[Note: I would advice not to use `puma` or `webrick` as your front server, rather you should use `nginx` as a proxy in front of these servers, and then server request using `puma` or `webrick`]

## LICENSE
To learn about the project license, visit [here](https://github.com/reyadussalahin/sinatra-simple/blob/master/LICENSE).


## Contributing
This project is beginner friendly and open for contributing. So, any improvements, issues or feature requests are very much welcome.
