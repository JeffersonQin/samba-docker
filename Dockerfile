FROM ubuntu:22.04
RUN apt update && apt -y install ca-certificates
RUN echo "US/Eastern" > /etc/timezone
RUN apt update && apt -y install samba
COPY smb.conf /root/
COPY configure.sh /root/
RUN cat /root/smb.conf >> /etc/samba/smb.conf
RUN mkdir /root/sambashare
CMD /bin/bash /root/configure.sh
