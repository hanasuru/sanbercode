FROM gotechnies/alpine-ssh

RUN apk update 
RUN apk upgrade
RUN apk add python3 lighttpd --no-cache
RUN apk add apache2
RUN apk add curl

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mkdir /root/.ssh
RUN mkdir -p /run/apache2

ADD id_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22 80

CMD ./service.sh

