
FROM ubuntu:trusty
MAINTAINER Travis Holton <travis@ideegeo.com>


RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty main universe' > /etc/apt/sources.list.d/nodepp.list

RUN apt-get update
RUN apt-get install -y software-properties-common python expat
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs node-gyp libnode-node-expat node-node-expat

RUN apt-get clean
ADD package.json /tmp/package.json
RUN npm test

CMD ["./docker_start.sh"]
