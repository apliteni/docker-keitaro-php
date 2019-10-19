FROM centos:7

RUN yum install -y deltarpm epel-release \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y

RUN yum install -y --enablerepo=remi php73 \
                                     php73-php-bcmath \
                                     php73-php-devel \
                                     php73-php-ioncube-loader \
                                     php73-php-mbstring \
                                     php73-php-mysqlnd \
                                     php73-php-pear \
                                     php73-php-pecl-redis \
                                     php73-php-pecl-zip \
                                     php73-php-xml

RUN yum install -y --enablerepo=epel fcgi

RUN ln -s /usr/bin/php73 /usr/bin/php \
    && ln -s /opt/remi/php73/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php73 /etc/php

RUN sed -i -r -e 's/^;?memory_limit = .*/memory_limit=-1/' /etc/php/php.ini

VOLUME ["/data", "/cache"]
WORKDIR /data

ENTRYPOINT ["/usr/bin/php"]
