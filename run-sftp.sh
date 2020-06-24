#!/bin/bash
# Add ssh system user
useradd -m -p $(mkpasswd -m sha-512 -s ${FTP_PASS}) ${FTP_USER}

# Create a test file and test dir for SFTP tests
mkdir -p /home/${FTP_USER}/Testdir
echo -e "This is a test file." > /home/${FTP_USER}/README.md
chown -R ${FTP_USER}:${FTP_USER} /home/${FTP_USER}/*

# Run mysecureshell
/usr/sbin/sshd -D
