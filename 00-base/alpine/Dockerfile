FROM alpine:3.20.3

RUN apk update
RUN apk add --no-cache \
    bash \
    git \
    curl \
    wget

RUN mkdir -p /autograder/work
RUN mkdir -p /autograder/submission
RUN mkdir -p /autograder/output
RUN mkdir -p /autograder/scripts

COPY scripts/* /autograder/scripts/

WORKDIR /autograder/work

ENTRYPOINT ["/bin/bash", "/autograder/scripts/main.sh"]
