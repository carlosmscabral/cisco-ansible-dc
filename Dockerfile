FROM centos:latest
RUN yum -y update && yum -y upgrade && yum -y install git
RUN curl "https://bootstrap.pypa.io/get-pip.py" | python
RUN pip install ansible
RUN pip install ucsmsdk
RUN mkdir /ansible
