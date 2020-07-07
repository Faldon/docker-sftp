Simple sftp server based on mysecureshell

# Usage
    $ docker run -d --expose 20 --expose 21 --expose 22 \
                 -e FTP_USER=<username> -e FTP_PASS=<password> \
                 --name sftp --restart=always faldon/sftp
