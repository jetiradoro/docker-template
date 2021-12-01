FROM ubuntu/apache2:2.4-20.04_beta

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# SYS
RUN apt update \
	&& apt install -y iputils-ping \
	&& apt install -y cron \
	&& apt install -y vim \
	&& apt install -y git \
	&& apt install -y sshpass \
	&& apt install -y dos2unix \
	&& apt install -y unzip \
	&& apt install -y language-pack-en-base


# PHP
RUN	apt install -y software-properties-common \
	&& LC_ALL=en_US.UTF-8 \
	&& LANG=en_US.UTF-8 \
	&& LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php \
	&& apt update \
	&& apt install -y curl \
	&& apt install -y php8.0 \
	&& apt install -y libapache2-mod-php8.0 \
	&& apt install -y php8.0-mbstring \
	&& apt install -y php8.0-gd \
	&& apt install -y php8.0-imap \
	&& apt install -y php8.0-intl \
	&& apt install -y php8.0-xdebug \
	&& apt install -y php8.0-curl \
	&& apt install -y php8.0-mysql \
	&& apt install -y php8.0-cli \
	&& apt install -y php8.0-readline \
	&& apt install -y php8.0-mcrypt \
	&& apt install -y php8.0-mysqli \
	&& apt install -y php-cli php-xml \
	&& apt install -y mysql-client

RUN a2enmod rewrite
RUN apt install -y certbot python3-certbot-apache


# NODEJS
WORKDIR /root
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt install -y nodejs


# COMPOSER
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
	&& HASH=`curl -sS https://composer.github.io/installer.sig` \
	&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer


ADD .bash_aliases /root/
ADD .bash_prompt /root/
ADD .bash_extra /root/

RUN mkdir /scripts
RUN mkdir -p /data
RUN mkdir -p /app/public

ADD init_container.sh /scripts
ADD docker_xdebug.ini /scripts
ADD docker_http.conf /scripts
ADD cron_laravel.txt /scripts
ADD apache_env.conf /scripts
ADD .bashrc /scripts

WORKDIR /scripts
# Windows compatibility
RUN dos2unix /scripts/init_container.sh
RUN dos2unix /scripts/docker_http.conf
RUN dos2unix /scripts/apache_env.conf
RUN dos2unix /scripts/.bashrc
RUN dos2unix /scripts/cron_laravel.txt
RUN dos2unix /root/.bash_aliases
RUN dos2unix /root/.bash_prompt
RUN dos2unix /root/.bash_extra

RUN chmod +x init_container.sh
RUN ln -s /scripts/docker_http.conf /etc/apache2/sites-enabled
RUN ln -s /scripts/docker_xdebug.ini /etc/php/8.0/apache2/conf.d/docker_xdebug.ini
RUN ln -s /scripts/apache_env.conf /etc/apache2/conf-enabled
RUN rm -Rf /etc/apache2/sites-enabled/000-default.conf 


EXPOSE 80 443

WORKDIR /app










