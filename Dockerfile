FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server

RUN echo "root:1234" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo "HELLO" > /etc/motd

CMD ["/usr/sbin/sshd", "-D"]