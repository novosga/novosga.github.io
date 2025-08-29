# Instalação via Docker

É necessário ter o Docker instalado no ambiente: https://docs.docker.com/engine/installation/

!> Formato da URL de conexão com o banco de dados: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

## Container simples

Executando um simples container:

```sh
# aplicação base
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=5.7" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_URL: http://mercure:3000/.well-known/mercure \
  -e MERCURE_PUBLIC_URL: http://127.0.0.1:3000/.well-known/mercure \
  novosga/novosga:2.2-standalone

# serviço mercure para troca de mensagens
docker run --rm -it \
    -p 3000:3000 \
    -e 'SERVER_NAME=:3000' \
    -e 'MERCURE_PUBLISHER_JWT_KEY=!ChangeThisMercureHubJWTSecretKey!' \
    -e 'MERCURE_EXTRA_DIRECTIVES=anonymous 1; cors_origins *' \
    novosga/mercure:v0.11
```

## Docker Compose

Criar arquivo docker-compose.yml com o conteúdo abaixo:

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
      NOVOSGA_ADMIN_FIRSTNAME: 'Administrador'
      NOVOSGA_ADMIN_LASTNAME: 'Global'
      # default unity
      NOVOSGA_UNITY_NAME: 'Minha unidade'
      NOVOSGA_UNITY_CODE: 'U01'
      # default no-priority
      NOVOSGA_NOPRIORITY_NAME: 'Normal'
      NOVOSGA_NOPRIORITY_DESCRIPTION: 'Atendimento normal'
      # default priority
      NOVOSGA_PRIORITY_NAME: 'Prioridade'
      NOVOSGA_PRIORITY_DESCRIPTION: 'Atendimento prioritário'
      # default place
      NOVOSGA_PLACE_NAME: 'Guichê'
      # Set TimeZone and locale
      TZ: 'America/Sao_Paulo'
      APP_LANGUAGE: 'pt_BR'
      # Endereço Mercure para publicar mensagem (onde "mercure" é o nome do host)
      # esse endereço será chamado internamente via o PHP
      MERCURE_URL: http://mercure:3000/.well-known/mercure
      # Endereço Mercure para consumir mensagem
      # esse endereço será chamado via o navegador web
      MERCURE_PUBLIC_URL: http://127.0.0.1:3000/.well-known/mercure
      # the default secret key, must be the same as MERCURE_PUBLISHER_JWT_KEY
      MERCURE_JWT_SECRET": "!ChangeThisMercureHubJWTSecretKey!"
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

Executando docker-compose:

    docker-compose up -d

Acessar o banco de dados MySQL como `root`:

    docker-compose exec mysqldb sh -c  'mysql -uroot -p'

Dar permissão de acesso para o usuário da aplicação:

    GRANT ALL ON novosga2.* TO 'novosga'@'%' IDENTIFIED BY 'MySQL_App_P4ssW0rd';
    quit
