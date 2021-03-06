FROM adamoss/rpi-zero-kali2-base
# THIS IS FOR RASPBERRY PI ZERO
MAINTAINER Adam Ossenford <AdamOssenford@gmail.com>
####################################################
# UPDATE APT AND INSTALL THE METASPLOIT FRAMEWORK
####################################################
RUN apt-get update -y && apt-get install metasploit-framework -y && msfupdate
####################################################
# CUSTOMIZE METASPLOIT BANNER TO SOMETHING SECKC
####################################################
RUN rm /usr/share/metasploit-framework/data/logos/*.txt
COPY seckc-docker.txt /usr/share/metasploit-framework/data/logos/cowsay.txt
####################################################
# SOMETIMES THE DATABASE SUCKS SO RESTART IT NOW
####################################################
RUN service postgresql restart
####################################################
# WE ENTER AT /bin/bash YOU COULD CHANGE THIS
####################################################
ENTRYPOINT ["/bin/bash"]
