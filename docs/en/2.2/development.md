# Development

See below how to set up a development environment using Docker.

## Clone project

```sh
git clone -b v2.2 https://github.com/novosga/novosga.git
cd novosga/
```

## Start container

Run the command below inside the novosga directory, which will be shared via volume:

```sh
docker run --name=novosga-21-dev -it -v './:/var/www/app' -p 8000:8000 php:7.2.34-cli /bin/bash
```

Once the container is created, when you want to start it again, just use the name informed in the previous command:

```sh
docker start novosga-21-dev -ai
```

## Prepare container

You only need to perform this step the first time you create the container.

```sh
# update source.list
sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list

# install necessary extensions
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/download/1.10.27/composer.phar -o composer.phar
php composer.phar install
```

## NovoSGA Configuration

!> As of Symfony 5, the `.env.dist` file no longer exists, it has been renamed to `.env` and for local configurations you should use `.env.local`

Create a `.env.local` file with the database connection URL, and other mandatory variables. After creating the file, the NovoSGA installation command will be executed (creation of tables and basic data).

```sh
# change connection according to local environment
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=5.7&charset=utf8"' > .env.local
echo 'LANGUAGE="en_US"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
# Mercure address to publish message (where "mercure" is the host name)
# this address will be called internally via PHP
echo 'MERCURE_PUBLISH_URL=http://mercure:3000/.well-known/mercure' >> .env.local
# Mercure address to consume message
# this address will be called via the web browser
echo 'MERCURE_CONSUMER_URL=http://127.0.0.1:3000/.well-known/mercure' >> .env.local

php bin/console novosga:install
```


## Start development web server

First you need to download the Symfony CLI

```
curl -sS https://get.symfony.com/cli/installer | bash
mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
```

After starting the development server, just open the URL [127.0.0.1:8000](http://127.0.0.1:8000/)

```sh
symfony server:start
```
