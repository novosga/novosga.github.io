# Instalação no Linux

Passo-a-passo para instalação do Novo SGA no GNU/Linux para as principais distribuições.

**Requisitos**

- GNU/Linux:
    - Ubuntu 14.04+ ou
    - Debian 8+ ou
    - CentOS / RHEL
- MySQL 5.7 **já instalado**
- PHP 7.1+
- Apache2 ou NGINX

## PHP 7.1

Ubuntu 14.04 - 16.10:

    sudo apt install software-properties-common python-software-properties
    sudo apt-add-repository ppa:ondrej/php
    sudo apt update
    sudo apt install php7.1 php7.1-mysql php7.1-curl php7.1-zip php7.1-intl php7.1-xml php7.1-mbstring php-gettext

Debian 8 (Jessie):

    apt-get install apt-transport-https lsb-release ca-certificates
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
    sudo apt-get update
    sudo apt install php7.1 php7.1-mysql php7.1-curl php7.1-zip php7.1-intl php7.1-xml php7.1-mbstring php-gettext

CentOS / RHEL 7.2 & 7.3

    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
    sudo subscription-manager repos --enable=rhel-7-server-optional-rpms
    sudo yum install yum-utils
    sudo yum-config-manager --enable remi-php71
    sudo yum install php71 php71-php-curl php71-php-cli php71-php-mbstring php71-php-zip php71-php-xml php71-php-pdo php71-php-mysql


## Novo SGA v2.x

Baixar **Composer**

    curl -fSL https://getcomposer.org/composer.phar -o composer.phar

Criar o projeto:

    php composer.phar create-project "novosga/novosga:^2.0" ~/novosga

Instalar e configurar servidor HTTP: [Apache2](install-linux.md#Apache2) ou [NGINX](install-linux.md#NGINX).

## Apache2

Instalar pacote:

**Debian/Ubuntu**

    sudo apt install apache2

**CentOS/RHEL**

    sudo yum -y install httpd
    sudo systemctl enable httpd.service
    sudo systemctl start httpd.service

Habilitar os módulos `rewrite` e `env` do Apache2.

**Debian/Ubuntu**

    sudo a2enmod rewrite env

**CentOS/RHEL**

    Editar arquivo /etc/httpd/conf.modules.d/00-base.conf manualmente

Mover o diretório da aplicação já instalada:

    sudo mv ~/novosga /var/www/

Preparar o cache da aplicação para o ambiente de produção:
    
    bin/console cache:clear --no-debug --no-warmup --env=prod
    bin/console cache:warmup --env=prod
    
Alterar o dono e dar permissão de escrita no diretório `var` da aplicação:

    sudo chown www-data:www-data -R /var/www/novosga
    sudo chmod +w -R /var/www/novosga/var/

Alterar diretório raiz do site e habilitar `.htaccess`:

**Debian/Ubuntu**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/apache2/sites-available/000-default.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

**CentOS/RHEL**

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/httpd/conf/httpd.conf
    sudo sed -i 's|AllowOverride None|AllowOverride All|g' /etc/httpd/conf/httpd.conf

Configurar timezone:

**Debian/Ubuntu**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.1/apache2/conf.d/datetimezone.ini

**CentOS/RHEL**

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php.ini

Criar arquivo `.htaccess` dentro do diretório `public` da aplicação com as configurações de conexão com o banco:

!> Formato da URL de conexão com o banco de dados: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

    echo 'Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ index.php [QSA,L]
    SetEnv APP_ENV prod
    SetEnv LANGUAGE pt_BR
    SetEnv DATABASE_URL mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7
    ' > /var/www/novosga/public/.htaccess

Reiniciar serviço do Apache2:

**Debian/Ubuntu**

    sudo service apache2 restart

**CentOS/RHEL**

    sudo service httpd restart

Executar comando `install` do Novo SGA:

    APP_ENV=prod \
        LANGUAGE=pt_BR \
        DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
        bin/console novosga:install

## NGINX

TODO
