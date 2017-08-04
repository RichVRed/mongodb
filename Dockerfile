FROM        ubuntu:16.04
MAINTAINER  Robert Reiz <reiz@versioneye.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN apt-get upgrade -y --force-yes
RUN apt-get install -y --force-yes -q apt-utils
RUN apt-get install -y --force-yes -q adduser
RUN apt-get install -y --force-yes -q mongodb-org=3.4.6
RUN apt-get install -y --force-yes -q mongodb-org-server=3.4.6
RUN apt-get install -y --force-yes -q mongodb-org-shell=3.4.6
RUN apt-get install -y --force-yes -q mongodb-org-mongos=3.4.6
RUN apt-get install -y --force-yes -q mongodb-org-tools=3.4.6

RUN mkdir -p /data
RUN mkdir -p /data/db
RUN mkdir -p /data/logs

ADD start_mongodb.sh /start_mongodb.sh
ADD mongod.conf /mongod.conf
ADD mongod.conf /data/mongod.conf

RUN chmod ugo+x /start_mongodb.sh

# Define mountable directories.
VOLUME ["/data"]

CMD /start_mongodb.sh

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

