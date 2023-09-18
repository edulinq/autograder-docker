FROM autograder.base

RUN pip3 install autograder-py==0.1.0

COPY scripts /autograder/scripts

# TODO(eriq): Entrypoint?

WORKDIR /autograder
CMD ["/autograder/scripts/run_grader.sh"]
