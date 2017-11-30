# Instalação no Linux (Ubuntu/Debian)

Passo-a-passo para instalação do Novo SGA no GNU/Linux, distribuições baseadas no `Debian`.

## PHP

Adicionar repositório do `PHP 7.1`.

    sudo apt-add-repository ppa:ondrej/php
    sudo apt update

Instalar pacotes:

    sudo apt install php7.1 php7.1-mysql php7.1-curl php7.1-zip php7.1-intl php7.1-xml php-gettext

## Novo SGA

Baixar e extrair o projeto:

    mkdir ~/novosga
    cd ~/novosga
    curl -fSL https://github.com/novosga/novosga/archive/v2.0.0-BETA5.tar.gz -o novosga.tar.gz
    tar -xz --strip-components=1 -f novosga.tar.gz
    rm novosga.tar.gz

Baixar o `composer`:

    curl -fSL https://getcomposer.org/composer.phar -o composer.phar

Instalar as dependências:

    composer install

Instalar e configurar servidor HTTP: [Apache2](install-linux.md#Apache2) ou [NGINX](install-linux.md#NGINX).

## Apache2

Instalar pacote:

    sudo apt install apache2

Habilitar os módulos `rewrite` e `env` do Apache2.

    sudo a2enmod rewrite env

Mover o diretório da aplicação já instalada e alterar o dono:

    sudo mv ~/novosga /var/www/
    sudo chown www-data:www-data -R ~/novosga

Alterar diretório raiz do site:

    sudo sed -i 's|/var/www/html|/var/www/novosga/public|g' /etc/apache2/sites-available/000-default.conf

Configurar timezone:

    sudo echo 'date.timezone = America/Sao_Paulo' > /etc/php/7.1/apache2/conf.d/datetimezone.ini

Criar arquivo `.htaccess` com as configurações de conexão com o banco:

    sudo echo 'Options -MultiViews
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^(.*)$ index.php [QSA,L]
    SetEnv APP_ENV prod
    SetEnv DATABASE_URL mysql://novosga@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7
    SetEnv DATABASE_PASS MySQL_App_P@ssW0rd!' > /var/www/novosga/public/.htaccess

Reiniciar serviço do Apache2:

    sudo service apache2 restart

Executar comando `install` do Novo SGA:

    APP_ENV=prod \
    DATABASE_URL="mysql://novosga@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
    DATABASE_PASS=MySQL_App_P@ssW0rd! \
    bin/console novosga:install

## NGINX

TODO
