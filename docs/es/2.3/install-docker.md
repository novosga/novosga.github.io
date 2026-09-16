# Instalación a través de Docker

Es necesario tener Docker instalado en el entorno: https://docs.docker.com/engine/installation/

!> Formato de la URL de conexión a la base de datos: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

La imagen `novosga/novosga:2.3-standalone` ejecuta tres servicios mediante supervisord: servidor web (nginx + php-fpm), planificador de tareas (supercronic — reinicio nocturno de tickets) y Symfony Messenger (procesamiento asíncrono de mensajes). Mercure está integrado en la imagen, no se requiere un contenedor separado.

## Instalación automatizada

El siguiente script automatiza todo el proceso descrito en esta página: genera aleatoriamente las contraseñas y el `MERCURE_JWT_SECRET`, detecta la IP pública para `MERCURE_PUBLIC_URL`, crea el `docker-compose.yml`, levanta los contenedores y otorga el permiso del usuario en la base de datos.

```sh
curl -fsSL https://novosga.org/scripts/install-docker-2.3.sh | bash
```

o con `wget`:

```sh
wget -qO- https://novosga.org/scripts/install-docker-2.3.sh | bash
```

El script pregunta interactivamente cada valor (directorio de instalación, puerto, usuario/contraseña del admin, unidad predeterminada, etc.) — basta con presionar Enter para aceptar el valor sugerido. Al finalizar, las credenciales generadas quedan guardadas en `CREDENTIALS.txt` dentro del directorio de instalación.

Si prefiere configurarlo manualmente, siga las instrucciones a continuación.

## Contenedor simple

Ejecutando un contenedor simple:

```sh
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=8.0" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!" \
  novosga/novosga:2.3-standalone
```

## Docker Compose

Cree un archivo docker-compose.yml con el siguiente contenido:

```yaml
services:
  novosga:
    image: novosga/novosga:2.3-standalone
    restart: always
    depends_on:
      - mysqldb
    ports:
      - "80:8080"
    environment:
      APP_ENV: 'prod'
      # conexión a la base de datos
      DATABASE_URL: 'mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=8.0'
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
      # Claves JWT de Mercure (deben tener el mismo valor y cambiarse en producción)
      # MERCURE_JWT_SECRET: clave utilizada por la aplicación PHP para publicar en Mercure
      # MERCURE_PUBLISHER_JWT_KEY: clave de configuración del hub Mercure integrado
      MERCURE_JWT_SECRET: "!ChangeThisMercureHubJWTSecretKey!"
      MERCURE_PUBLISHER_JWT_KEY: "!ChangeThisMercureHubJWTSecretKey!"
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
