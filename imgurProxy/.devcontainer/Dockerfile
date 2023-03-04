FROM perlt/workspace

RUN sudo apk add nodejs npm curl terraform python3

ENV DOCKER_HOST=unix:///var/run/user/1000/docker.sock


RUN sudo apk add bash py-pip
RUN sudo apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev
RUN pip install azure-cli
RUN sudo apk del --purge build

ENV PATH="$PATH:/home/perlt/.local/bin"


# RUN curl -L https://aka.ms/InstallAzureCli | bash
