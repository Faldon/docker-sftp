FROM ubuntu:bionic

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
 -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
 mysecureshell whois procps openssh-server
RUN apt-get clean

ENV FTP_USER admin
ENV FTP_PASS admin

COPY run-sftp.sh /usr/sbin/

RUN mkdir /var/run/sshd
RUN chmod +x /usr/sbin/run-sftp.sh

EXPOSE 20 21 22

CMD ["/usr/sbin/run-sftp.sh"]
