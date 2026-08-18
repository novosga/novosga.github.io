# Instalação via Docker

É necessário ter o Docker instalado no ambiente: https://docs.docker.com/engine/installation/

!> Formato da URL de conexão com o banco de dados: http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url

A imagem `novosga/novosga:2.3-standalone` executa três serviços via supervisord: servidor web (nginx + php-fpm), agendador de tarefas (supercronic — reset noturno de senhas) e Symfony Messenger (processamento assíncrono de mensagens). O Mercure está integrado à imagem, não sendo necessário um container separado.

## Container simples

Executando um simples container:

```sh
docker run --rm \
  -p 80:8080 \
  -e DATABASE_URL="mysql://novosga:MySQL_App_P4ssW0rd@mysqldb:3306/novosga2?charset=utf8mb4&serverVersion=8.0" \
  -e MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!" \
  -e MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!" \
  novosga/novosga:2.3-standalone
```

## Docker Compose

Criar arquivo docker-compose.yml com o conteúdo abaixo:

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
      # Chaves JWT do Mercure (devem ter o mesmo valor e ser alteradas em produção)
      # MERCURE_JWT_SECRET: chave usada pela aplicação PHP para publicar no Mercure
      # MERCURE_PUBLISHER_JWT_KEY: chave de configuração do hub Mercure integrado
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
