# ErrBot Docker
This repository contains the Dockerfile and associated bits and pieces to build
a [Docker Container](http://www.docker.com) that provides the
[ErrBot](http://errbot.io) chatbot.  Building should be as simple
as cloning the repository and then running the command:

	sudo docker build --rm -t <username>/errbot .

You can change the configuration of ErrBot by editing the config.py.template
file.  Because we use Slack, the default configuration uses that backend.  The
build pulls the latest version of ErrBot from the master branch, try one of the
other branches within this repository if you need a specific version of ErrBot.

Storing credentials in Dockerfiles is a bad idea as they tend to leak into
version control systems, so we parameterise the config using envsubst.  By default
you need to pass the following environment variables when running the container:

	ERRBOT_TOKEN - your Slack access token
	ERRBOT_ADMIN - the name of an admin user, e.g. @keith
	ERRBOT_NAME - the name your bot will use in chatrooms

So to run the container:

	sudo docker run -ti -rm -e ERRBOT_TOKEN='...' \
		-e ERRBOT_ADMIN='...' \
		-e ERRBOT_NAME='...' \
		<username>/errbot

Within the container ErrBot is run in the foreground and sends all the logs to
STDOUT, this is done to help debugging during  plugin development.  You can 
easily add your own plugins by creating the appropriate .plug and .py files in 
the plugins directory before building the container.

We are in the process of putting automated builds and pushes of the containers
to the [Passback Docker Hub](https://hub.docker.com/u/passback/) in place using 
[Travis](https://travis-ci.org).

## Copyright and License
For what it's worth, the files in this repository are under the Apache 2.0 license.

## Contact
Passback Consulting http://www.passback.co.uk [<enquiries@passback.co.uk>](mailto:enquiries@passback.co.uk)
