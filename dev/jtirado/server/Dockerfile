FROM ubuntu/apache2:2.4-20.04_beta

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# SYS
RUN apt update \
	&& apt install -y iputils-ping \
	&& apt install -y cron \
	&& apt install -y sudo \
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
	&& apt install -y mysql-client \
	&& a2enmod rewrite \
	&& apt install -y certbot python3-certbot-apache

# COMPOSER
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
	&& HASH=`curl -sS https://composer.github.io/installer.sig` \
	&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer 

# NODEJS
WORKDIR /root
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
	&& chmod +x nodesource_setup.sh \
	&& ./nodesource_setup.sh \
	&& apt install -y nodejs 


RUN useradd -u 1000 -G www-data,sudo -m innovait \
	&& echo "innovait:secret" | chpasswd

USER innovait

# USER ENVIRONMENT
COPY [".bash_aliases", ".bash_prompt" ,".bash_extra","/home/innovait/"]

USER root
RUN mkdir /scripts \
	&& mkdir -p /data \
	&& mkdir -p /app/public

COPY ["init_container.sh", "docker_xdebug.ini" ,"docker_http.conf","cron_laravel.txt","apache_env.conf",".bashrc","/scripts/"]

WORKDIR /scripts
# Windows compatibility
RUN dos2unix /scripts/init_container.sh \
	&&  dos2unix /scripts/docker_http.conf \
	&&  dos2unix /scripts/apache_env.conf \
	&&  dos2unix /scripts/.bashrc \
	&&  dos2unix /scripts/cron_laravel.txt \
	&&  dos2unix /home/innovait/.bash_aliases \
	&&  dos2unix /home/innovait/.bash_prompt \
	&&  dos2unix /home/innovait/.bash_extra \
	&& chmod +x init_container.sh \
	&& ln -s /scripts/docker_http.conf /etc/apache2/sites-enabled \
	&& ln -s /scripts/docker_xdebug.ini /etc/php/8.0/apache2/conf.d/docker_xdebug.ini \
	&& ln -s /scripts/apache_env.conf /etc/apache2/conf-enabled \
	&& rm -Rf /etc/apache2/sites-enabled/000-default.conf \
	&& chown innovait:innovait /home/innovait/.bash*



USER innovait

EXPOSE 80 443
WORKDIR /app










