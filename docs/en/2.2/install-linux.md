# Installation on Linux

Step-by-step for installing NovoSGA on GNU/Linux for the main distributions.

**Requirements**

- GNU/Linux:
    - Ubuntu 20.04+ or
    - Debian 10+ or
    - CentOS / RHEL
- MySQL 8.0 or PostgreSQL 13+ **(already installed)**
- PHP 8.2
- Apache2 or NGINX

## PHP 8.2

Ubuntu 14.04 - 16.10:

    sudo apt install software-properties-common python-software-properties
    sudo apt-add-repository ppa:ondrej/php
    sudo apt update
    sudo apt install php8.2 php8.2-mysql php8.2-pgsql php8.2-curl php8.2-zip php8.2-intl php8.2-xml php8.2-mbstring php-gettext

Debian 8 (Jessie):

    apt-get install apt-transport-https lsb-release ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
    sudo apt-get update
    sudo apt install php8.2 php8.2-mysql php8.2-curl php8.2-zip php8.2-intl php8.2-xml php8.2-mbstring php-gettext

CentOS / RHEL

    sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum-config-manager --enable remi-php82
    sudo yum install php php-{curl,cli,mbstring,zip,xml,php-pdo,php-mysql,pdo-pgsql}


## NovoSGA v2.2

Download **Composer**

    curl -fSL https://getcomposer.org/composer.phar -o composer.phar

Create the project:

    php composer.phar create-project "novosga/novosga:^2.2" ~/novosga

Install and configure HTTP server: [Apache2](install-linux.md#Apache2) or [NGINX](install-linux.md#NGINX).

## Apache2

Install package:

**Debian/Ubuntu**

    sudo apt install apache2

**CentOS/RHEL**

    sudo yum -y install httpd
    sudo systemctl enable httpd.service
    sudo systemctl start httpd.service

Enable the `rewrite` and `env` modules of Apache2.

**Debian/Ubuntu**

    sudo a2enmod rewrite env

**CentOS/RHEL**

    Edit the /etc/httpd/conf.modules.d/00-base.conf file manually

Move the already installed application directory:

    sudo mv ~/novosga /var/www/

Prepare the application cache for the production environment:
    
    bin/console cache:clear --no-debug --no-warmup --env=prod
    bin/console cache:warmup --env=prod
    
Change the owner and give write permission to the `var` directory of the application:

    sudo chown www-data:www-data -R /var/www/novosga
    sudo chmod +w -R /var/www/novosga/var/

Change the root directory of the site and enable `.htaccess`:

**Debian/Ubuntu**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/apache2/sites-available/000-default.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

**CentOS/RHEL**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/httpd/conf/httpd.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/httpd/conf/httpd.conf

Configure timezone:

**Debian/Ubuntu**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.1/apache2/conf.d/datetimezone.ini

**CentOS/RHEL**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php.ini

Create the `.htaccess` file inside the `public` directory of the application with the database connection settings:

!> Database connection URL format: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

    echo 'Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ index.php [QSA,L]
    SetEnv APP_ENV prod
    SetEnv LANGUAGE en_US
    SetEnv DATABASE_URL mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7
    ' > /var/www/novosga/public/.htaccess

Restart the Apache2 service:

**Debian/Ubuntu**

    sudo service apache2 restart

**CentOS/RHEL**

    sudo service httpd restart

Run the NovoSGA `install` command:

    APP_ENV=prod \
        LANGUAGE=en_US \
        DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
        bin/console novosga:install

## NGINX

TODO
