# Desarrollo

Vea a continuación cómo configurar un entorno de desarrollo con Docker.

## Clonar proyecto

```sh
git clone -b v2.3 https://github.com/novosga/novosga.git
cd novosga/
```

## Iniciar contenedor

Ejecute el siguiente comando dentro del directorio de novosga, que se compartirá a través del volumen:

```sh
docker run --name=novosga-23-dev -it -v './:/var/www/app' -p 8000:8000 php:8.2-cli /bin/bash
```

Una vez creado el contenedor, cuando desee volver a iniciarlo, simplemente use el nombre informado en el comando anterior:

```sh
docker start novosga-23-dev -ai
```

## Preparar contenedor

Solo necesita realizar este paso la primera vez que cree el contenedor.

```sh
# instalar extensiones necesarias
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/composer.phar -o composer.phar
php composer.phar install
```

## Configuración de NovoSGA

Cree un archivo `.env.local` con la URL de conexión a la base de datos y otras variables obligatorias. Después de crear el archivo, se ejecutará el comando de instalación de NovoSGA (creación de tablas y datos básicos).

```sh
# cambiar la conexión según el entorno local
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=8.0&charset=utf8mb4"' > .env.local
echo 'LANGUAGE="es_ES"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
echo 'MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!"' >> .env.local

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
