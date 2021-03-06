FROM ubuntu:16.04
 
MAINTAINER Deepak Kovvuri

ARG PASSWORD

RUN apt-get update && apt-get install -y supervisor apache2 openssh-server

RUN mkdir /var/run/sshd

RUN echo "root:${PASSWORD}" | chpasswd

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"

RUN echo "export VISIBLE=now" >> /etc/profile

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]