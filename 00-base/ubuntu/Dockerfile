FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y \
    locales \
    tzdata

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen

RUN apt-get install -y \
    curl \
    git \
    time \
    tree \
    vim \
    wget

RUN mkdir -p /autograder/work
RUN mkdir -p /autograder/submission
RUN mkdir -p /autograder/output
RUN mkdir -p /autograder/scripts

COPY scripts/* /autograder/scripts/

WORKDIR /autograder/work

ENTRYPOINT ["/bin/bash", "/autograder/scripts/main.sh"]
