# Instalación en Linux

Paso a paso para instalar NovoSGA en GNU/Linux para las principales distribuciones.

**Requisitos**

- GNU/Linux:
    - Ubuntu 20.04+ o
    - Debian 10+ o
    - CentOS / RHEL
- MySQL 8.0 o PostgreSQL 13+ **(ya instalado)**
- PHP 8.2
- Apache2 o NGINX

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

Descargar **Composer**

    curl -fSL https://getcomposer.org/composer.phar -o composer.phar

Crear el proyecto:

    php composer.phar create-project "novosga/novosga:^2.2" ~/novosga

Instalar y configurar el servidor HTTP: [Apache2](install-linux.md#Apache2) o [NGINX](install-linux.md#NGINX).

## Apache2

Instalar paquete:

**Debian/Ubuntu**

    sudo apt install apache2

**CentOS/RHEL**

    sudo yum -y install httpd
    sudo systemctl enable httpd.service
    sudo systemctl start httpd.service

Habilitar los módulos `rewrite` y `env` de Apache2.

**Debian/Ubuntu**

    sudo a2enmod rewrite env

**CentOS/RHEL**

    Edite el archivo /etc/httpd/conf.modules.d/00-base.conf manualmente

Mover el directorio de la aplicación ya instalada:

    sudo mv ~/novosga /var/www/

Preparar la memoria caché de la aplicación para el entorno de producción:
    
    bin/console cache:clear --no-debug --no-warmup --env=prod
    bin/console cache:warmup --env=prod
    
Cambiar el propietario y dar permiso de escritura en el directorio `var` de la aplicación:

    sudo chown www-data:www-data -R /var/www/novosga
    sudo chmod +w -R /var/www/novosga/var/

Cambiar el directorio raíz del sitio y habilitar `.htaccess`:

**Debian/Ubuntu**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/apache2/sites-available/000-default.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

**CentOS/RHEL**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/httpd/conf/httpd.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/httpd/conf/httpd.conf

Configurar la zona horaria:

**Debian/Ubuntu**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.1/apache2/conf.d/datetimezone.ini

**CentOS/RHEL**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php.ini

Cree el archivo `.htaccess` dentro del directorio `public` de la aplicación con la configuración de la conexión a la base de datos:

!> Formato de la URL de conexión a la base de datos: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

    echo 'Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ index.php [QSA,L]
    SetEnv APP_ENV prod
    SetEnv LANGUAGE es_ES
    SetEnv DATABASE_URL mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7
    ' > /var/www/novosga/public/.htaccess

Reinicie el servicio Apache2:

**Debian/Ubuntu**

    sudo service apache2 restart

**CentOS/RHEL**

    sudo service httpd restart

Ejecute el comando `install` de NovoSGA:

    APP_ENV=prod \
        LANGUAGE=es_ES \
        DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
        bin/console novosga:install

## NGINX

TODO
