FROM python:3.6-slim

LABEL maintainer="tbola45@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \
    apt-get install -y gnupg2 sshpass git openssh-client jq curl wget && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip install --upgrade pip cffi && \
    pip install ansible==2.9.7 && \
    pip install mitogen ansible-lint boto boto3 botocore paramiko jmespath awscli && \
    pip install --upgrade pywinrm

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
