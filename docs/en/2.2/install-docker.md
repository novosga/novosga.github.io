# Installation via Docker

It is necessary to have Docker installed in the environment: https://docs.docker.com/engine/installation/

!> Database connection URL format: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

## Simple container

Running a simple container:

```sh
# base application
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_URL="http://mercure:3000/.well-known/mercure" \
  -e MERCURE_PUBLIC_URL="http://127.0.0.1:3000/.well-known/mercure" \
  novosga/novosga:2.2-standalone

# mercure service for message exchange
docker run --rm -it \
    -p 3000:3000 \
    -e 'SERVER_NAME=:3000' \
    -e 'MERCURE_PUBLISHER_JWT_KEY=!ChangeMe!' \
    -e 'MERCURE_EXTRA_DIRECTIVES=anonymous 1; cors_origins *' \
    novosga/mercure:v0.11
```

## Docker Compose

Create a docker-compose.yml file with the content below:

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
      # database connection
      DATABASE_URL: 'mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7'
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
      NOVOSGA_PLACE_NAME: 'Counter'
      # Set TimeZone and locale
      TZ: 'America/Sao_Paulo'
      APP_LANGUAGE: 'en_US'
      # Mercure address to publish message (where "mercure" is the host name)
      # this address will be called internally via PHP
      MERCURE_URL: http://mercure:3000/.well-known/mercure
      # Mercure address to consume message
      # this address will be called via the web browser
      MERCURE_PUBLIC_URL: http://127.0.0.1:3000/.well-known/mercure
      # the default secret key, must be the same as MERCURE_PUBLISHER_JWT_KEY
      MERCURE_JWT_SECRET: "!ChangeThisMercureHubJWTSecretKey!"
  mercure:
    image: novosga/mercure:v0.11
    restart: always
    ports:
      - "3000:3000"
    environment:
      # same value from ports
      SERVER_NAME: ":3000"
      # default publish key, must be changed
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
      # Set TimeZone
      TZ: 'America/Sao_Paulo'
```

Running docker-compose:

    docker-compose up -d

Access the MySQL database as `root`:

    docker-compose exec mysqldb sh -c  'mysql -uroot -p'

Grant access permission to the application user:

    GRANT ALL ON novosga2.* TO 'novosga'@'%' IDENTIFIED BY 'MySQL_App_P4ssW0rd';
    quit
