FROM ubuntu:14.04

USER root

# Configure workspace.
RUN mkdir /Workspace
WORKDIR /Workspace

RUN dpkg --add-architecture i386
RUN apt-get update -qq

# Install python.
RUN apt-get install -y python

# Install required packages.
RUN apt-get install -y \
	software-properties-common \
	git-core \
	gnupg \
	flex \
	bison \
	gperf \
	build-essential \
	zip \
	curl \
	zlib1g-dev \
	gcc-multilib \
	g++-multilib \
	libc6-dev-i386 \
	lib32ncurses5-dev \
	x11proto-core-dev \
	libx11-dev \
	lib32z-dev \
	ccache \
	libgl1-mesa-dev \
	libxml2-utils \
	xsltproc \
	unzip \
	make \
	python-networkx

# Install openjdk8.
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update -qq
RUN apt-get install -y openjdk-8-jdk

# Clean apt cache.
RUN apt-get clean -y