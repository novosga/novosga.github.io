# Desarrollo

Vea a continuación cómo configurar un entorno de desarrollo con Docker.

## Clonar proyecto

```sh
git clone -b v2.2 https://github.com/novosga/novosga.git
cd novosga/
```

## Iniciar contenedor

Ejecute el siguiente comando dentro del directorio de novosga, que se compartirá a través del volumen:

```sh
docker run --name=novosga-21-dev -it -v './:/var/www/app' -p 8000:8000 php:7.2.34-cli /bin/bash
```

Una vez creado el contenedor, cuando desee volver a iniciarlo, simplemente use el nombre informado en el comando anterior:

```sh
docker start novosga-21-dev -ai
```

## Preparar contenedor

Solo necesita realizar este paso la primera vez que cree el contenedor.

```sh
# actualizar source.list
sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list

# instalar extensiones necesarias
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/download/1.10.27/composer.phar -o composer.phar
php composer.phar install
```

## Configuración de NovoSGA

!> A partir de Symfony 5, el archivo `.env.dist` ya no existe, ha sido renombrado a `.env` y para las configuraciones locales debe usar `.env.local`

Cree un archivo `.env.local` con la URL de conexión a la base de datos y otras variables obligatorias. Después de crear el archivo, se ejecutará el comando de instalación de NovoSGA (creación de tablas y datos básicos).

```sh
# cambiar la conexión según el entorno local
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=5.7&charset=utf8"' > .env.local
echo 'LANGUAGE="es_ES"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
# Dirección de Mercure para publicar mensajes (donde "mercure" es el nombre del host)
# esta dirección se llamará internamente a través de PHP
echo 'MERCURE_PUBLISH_URL=http://mercure:3000/.well-known/mercure' >> .env.local
# Dirección de Mercure para consumir mensajes
# esta dirección se llamará a través del navegador web
echo 'MERCURE_CONSUMER_URL=http://127.0.0.1:3000/.well-known/mercure' >> .env.local

php bin/console novosga:install
```


## Iniciar servidor web de desarrollo

Primero necesita descargar el CLI de Symfony

```
curl -sS https://get.symfony.com/cli/installer | bash
mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
```

Después de iniciar el servidor de desarrollo, simplemente abra la URL [127.0.0.1:8000](http://127.0.0.1:8000/)

```sh
symfony server:start
```
