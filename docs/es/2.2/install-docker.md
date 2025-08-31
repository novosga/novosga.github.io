# Instalación a través de Docker

Es necesario tener Docker instalado en el entorno: https://docs.docker.com/engine/installation/

!> Formato de la URL de conexión a la base de datos: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

## Contenedor simple

Ejecutando un contenedor simple:

```sh
# aplicación base
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_URL="http://mercure:3000/.well-known/mercure" \
  -e MERCURE_PUBLIC_URL="http://127.0.0.1:3000/.well-known/mercure" \
  novosga/novosga:2.2-standalone

# servicio mercure para el intercambio de mensajes
docker run --rm -it \
    -p 3000:3000 \
    -e 'SERVER_NAME=:3000' \
    -e 'MERCURE_PUBLISHER_JWT_KEY=!ChangeMe!' \
    -e 'MERCURE_EXTRA_DIRECTIVES=anonymous 1; cors_origins *' \
    novosga/mercure:v0.11
```

## Docker Compose

Cree un archivo docker-compose.yml con el siguiente contenido:

```yaml
services:
  novosga:
    image: novosga/novosga:2.2-standalone
    restart: always
    depends_on:
      - mysqldb
    ports:
      - "80:8080"
    environment:
      APP_ENV: 'prod'
      # conexión a la base de datos
      DATABASE_URL: 'mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7'
      # usuario administrador predeterminado
      NOVOSGA_ADMIN_USERNAME: 'admin'
      NOVOSGA_ADMIN_PASSWORD: '123456'
      NOVOSGA_ADMIN_FIRSTNAME: 'Administrador'
      NOVOSGA_ADMIN_LASTNAME: 'Global'
      # unidad predeterminada
      NOVOSGA_UNITY_NAME: 'Mi unidad'
      NOVOSGA_UNITY_CODE: 'U01'
      # sin prioridad predeterminada
      NOVOSGA_NOPRIORITY_NAME: 'Normal'
      NOVOSGA_NOPRIORITY_DESCRIPTION: 'Servicio normal'
      # prioridad predeterminada
      NOVOSGA_PRIORITY_NAME: 'Prioridad'
      NOVOSGA_PRIORITY_DESCRIPTION: 'Servicio prioritario'
      # lugar predeterminado
      NOVOSGA_PLACE_NAME: 'Mostrador'
      # Establecer zona horaria y configuración regional
      TZ: 'America/Sao_Paulo'
      APP_LANGUAGE: 'es_ES'
      # Dirección de Mercure para publicar mensajes (donde "mercure" es el nombre del host)
      # esta dirección se llamará internamente a través de PHP
      MERCURE_URL: http://mercure:3000/.well-known/mercure
      # Dirección de Mercure para consumir mensajes
      # esta dirección se llamará a través del navegador web
      MERCURE_PUBLIC_URL: http://127.0.0.1:3000/.well-known/mercure
      # clave de publicación, debe ser la misma que MERCURE_PUBLISHER_JWT_KEY
      MERCURE_JWT_SECRET: "!ChangeThisMercureHubJWTSecretKey!"
  mercure:
    image: novosga/mercure:v0.11
    restart: always
    ports:
      - "3000:3000"
    environment:
      # mismo valor de los puertos
      SERVER_NAME: ":3000"
      # clave de publicación predeterminada, debe cambiarse
      MERCURE_PUBLISHER_JWT_KEY: "!ChangeThisMercureHubJWTSecretKey!"
      MERCURE_EXTRA_DIRECTIVES:  "anonymous 1; cors_origins *"
  mysqldb:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_USER: 'novosga'
      MYSQL_DATABASE: 'novosga2'
      MYSQL_ROOT_PASSWORD: 'MySQL_r00t_P4ssW0rd'
      MYSQL_PASSWORD: 'MySQL_App_P4ssW0rd'
      # Establecer zona horaria
      TZ: 'America/Sao_Paulo'
```

Ejecutando docker-compose:

    docker-compose up -d

Acceda a la base de datos MySQL como `root`:

    docker-compose exec mysqldb sh -c  'mysql -uroot -p'

Otorgue permiso de acceso al usuario de la aplicación:

    GRANT ALL ON novosga2.* TO 'novosga'@'%' IDENTIFIED BY 'MySQL_App_P4ssW0rd';
    quit

```
