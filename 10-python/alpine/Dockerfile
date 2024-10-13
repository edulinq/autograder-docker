ARG BASE_TAG=latest
FROM edulinq/grader.base-alpine:${BASE_TAG}

RUN apk update
RUN apk add --no-cache \
    python3 \
    py3-pip

COPY requirements.txt /autograder/
COPY scripts /autograder/scripts

RUN pip3 install --break-system-packages -r /autograder/requirements.txt

WORKDIR /autograder

CMD ["/autograder/scripts/run_grader.sh"]
