FROM centos:7

RUN yum install -y deltarpm epel-release \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y

RUN yum install -y --enablerepo=remi php72 \
                                     php72-php-bcmath \
                                     php72-php-devel \
                                     php72-php-ioncube-loader \
                                     php72-php-mbstring \
                                     php72-php-mysqlnd \
                                     php72-php-pear \
                                     php72-php-pecl-redis \
                                     php72-php-pecl-zip \
                                     php72-php-xml

RUN yum install -y --enablerepo=epel fcgi

RUN ln -s /usr/bin/php72 /usr/bin/php \
    && ln -s /opt/remi/php72/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php72 /etc/php

RUN sed -i -r -e 's/^;?memory_limit = .*/memory_limit=-1/' /etc/php/php.ini

VOLUME ["/data", "/cache"]
WORKDIR /data

ENTRYPOINT ["/usr/bin/php"]
