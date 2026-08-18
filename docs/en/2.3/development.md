# Development

See below how to set up a development environment using Docker.

## Clone project

```sh
git clone -b v2.3 https://github.com/novosga/novosga.git
cd novosga/
```

## Start container

Run the command below inside the novosga directory, which will be shared via volume:

```sh
docker run --name=novosga-23-dev -it -v './:/var/www/app' -p 8000:8000 php:8.2-cli /bin/bash
```

Once the container is created, when you want to start it again, just use the name informed in the previous command:

```sh
docker start novosga-23-dev -ai
```

## Prepare container

You only need to perform this step the first time you create the container.

```sh
# install necessary extensions
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/composer.phar -o composer.phar
php composer.phar install
```

## NovoSGA Configuration

Create a `.env.local` file with the database connection URL, and other mandatory variables. After creating the file, the NovoSGA installation command will be executed (creation of tables and basic data).

```sh
# change connection according to local environment
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=8.0&charset=utf8mb4"' > .env.local
echo 'LANGUAGE="en_US"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
echo 'MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!"' >> .env.local

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
