FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server

RUN mkdir -p /run/sshd
RUN useradd -m -s /bin/bash bildanjhry
RUN echo "bildanjhry:1234" | chpasswd
RUN mkdir -p /home/bildan/.ssh
COPY id_ed25519.pub /home/bildan/.ssh/authorized_keys

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config


RUN echo "HELLO" > /etc/motd

CMD ["/usr/sbin/sshd", "-D"]