FROM centos:7

RUN yum install -y deltarpm epel-release \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y

RUN yum install -y --enablerepo=remi php56 \
                                     php56-php-bcmath \
                                     php56-php-devel \
                                     php56-php-ioncube-loader \
                                     php56-php-mbstring \
                                     php56-php-mysqlnd \
                                     php56-php-pear \
                                     php56-php-pecl-redis \
                                     php56-php-pecl-zip \
                                     php56-php-xml

RUN yum install -y --enablerepo=epel fcgi

RUN ln -s /usr/bin/php56 /usr/bin/php \
    && ln -s /opt/remi/php56/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php56 /etc/php

RUN sed -i -r -e 's/^;?memory_limit = .*/memory_limit=-1/' /etc/php/php.ini

VOLUME ["/data", "/cache"]
WORKDIR /data

ENTRYPOINT ["/usr/bin/php"]
