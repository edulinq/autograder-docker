FROM eriqaugustine/autograder.base

COPY requirements.txt /autograder/
COPY scripts /autograder/scripts

RUN pip3 install -r /autograder/requirements.txt

WORKDIR /autograder

CMD ["/autograder/scripts/run_grader.sh"]
