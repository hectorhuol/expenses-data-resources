FROM mongo
MAINTAINER Hector Hurtado <hectorhuol@gmail.com>

VOLUME /data/db

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

EXPOSE 27017

CMD ["/run.sh"]