FROM centos:7

RUN yum install -y deltarpm epel-release \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum update -y

RUN yum install -y --enablerepo=remi php70 \
                                     php70-php-bcmath \
                                     php70-php-devel \
                                     php70-php-ioncube-loader \
                                     php70-php-mbstring \
                                     php70-php-mysqlnd \
                                     php70-php-pear \
                                     php70-php-pecl-redis \
                                     php70-php-pecl-zip \
                                     php70-php-xml

RUN yum install -y --enablerepo=epel fcgi

RUN ln -s /usr/bin/php70 /usr/bin/php \
    && ln -s /opt/remi/php70/root/bin/php-config /usr/bin/php-config \
    && ln -s /etc/opt/remi/php70 /etc/php

RUN sed -i -r -e 's/^;?memory_limit = .*/memory_limit=-1/' /etc/php/php.ini

VOLUME ["/data", "/cache"]
WORKDIR /data

ENTRYPOINT ["/usr/bin/php"]
