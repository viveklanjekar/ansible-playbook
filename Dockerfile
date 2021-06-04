FROM ubuntu:18.04
USER root
#Update and install python
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get -y install python groff curl man unzip wget jq git
#Change the dir and install pip
RUN cd /tmp
RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
#Change the dir and install awscli, hvac
RUN pip install awscli hvac pyhcl
#Install Ansible
RUN apt-get -y install ansible
ENTRYPOINT ["/bin/bash"]
