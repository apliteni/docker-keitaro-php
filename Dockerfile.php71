FROM centos:7

RUN yum install -y deltarpm epel-release \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y

RUN yum install -y --enablerepo=remi php71 \
                                     php71-php-bcmath \
                                     php71-php-devel \
                                     php71-php-ioncube-loader \
                                     php71-php-mbstring \
                                     php71-php-mysqlnd \
                                     php71-php-pear \
                                     php71-php-pecl-redis \
                                     php71-php-pecl-zip \
                                     php71-php-xml

RUN yum install -y --enablerepo=epel fcgi

RUN ln -s /usr/bin/php71 /usr/bin/php \
    && ln -s /opt/remi/php71/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php71 /etc/php

RUN sed -i -r -e 's/^;?memory_limit = .*/memory_limit=-1/' /etc/php/php.ini

VOLUME ["/data", "/cache"]
WORKDIR /data

ENTRYPOINT ["/usr/bin/php"]
