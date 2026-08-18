# Installation via Docker

It is necessary to have Docker installed in the environment: https://docs.docker.com/engine/installation/

!> Database connection URL format: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

The `novosga/novosga:2.3-standalone` image runs three services via supervisord: web server (nginx + php-fpm), task scheduler (supercronic — nightly ticket reset), and Symfony Messenger (async message processing). Mercure is integrated into the image — no separate container is required.

## Simple container

Running a simple container:

```sh
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=8.0" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!" \
  novosga/novosga:2.3-standalone
```

## Docker Compose

Create a docker-compose.yml file with the content below:

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
      # database connection
      DATABASE_URL: 'mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=8.0'
      # default admin user
      NOVOSGA_ADMIN_USERNAME: 'admin'
      NOVOSGA_ADMIN_PASSWORD: '123456'
      NOVOSGA_ADMIN_FIRSTNAME: 'Administrator'
      NOVOSGA_ADMIN_LASTNAME: 'Global'
      # default unity
      NOVOSGA_UNITY_NAME: 'My unit'
      NOVOSGA_UNITY_CODE: 'U01'
      # default no-priority
      NOVOSGA_NOPRIORITY_NAME: 'Normal'
      NOVOSGA_NOPRIORITY_DESCRIPTION: 'Normal service'
      # default priority
      NOVOSGA_PRIORITY_NAME: 'Priority'
      NOVOSGA_PRIORITY_DESCRIPTION: 'Priority service'
      # default place
      NOVOSGA_PLACE_NAME: 'Box'
      # Set TimeZone and locale
      TZ: 'UTC'
      APP_LANGUAGE: 'en_US'
      # Mercure JWT keys (must have the same value and be changed in production)
      # MERCURE_JWT_SECRET: key used by the PHP application to publish to Mercure
      # MERCURE_PUBLISHER_JWT_KEY: configuration key for the built-in Mercure hub
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
      TZ: 'UTC'
```

Run docker-compose:

    docker-compose up -d

Access the MySQL database as `root`:

    docker-compose exec mysqldb sh -c  'mysql -uroot -p'

Grant access permission to the application user:

    GRANT ALL ON novosga2.* TO 'novosga'@'%' IDENTIFIED BY 'MySQL_App_P4ssW0rd';
    quit
