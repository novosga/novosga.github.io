# Desenvolvimento

Veja abaixo como montar um ambiente de desenvolvimento utilizando Docker.

## Clonar projeto

```sh
git clone -b v2.3 https://github.com/novosga/novosga.git
cd novosga/
```

## Iniciar container

Rodar o comando abaixo dentro do diretório do novosga, que será compartilhado via volume:

```sh
docker run --name=novosga-23-dev -it -v './:/var/www/app' -p 8000:8000 php:8.2-cli /bin/bash
```

Uma vez criado o container, quando quiser iniciá-lo novamente, basta utilizar o nome informado no comando anterior:

```sh
docker start novosga-23-dev -ai
```

## Preparar container

Só precisa executar essa etapa na primeira vez que criar o container.

```sh
# instalar extensoes necessarias
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/composer.phar -o composer.phar
php composer.phar install
```

## Configuração do NovoSGA

Criar arquivo `.env.local` com a URL de conexão com o banco de dados, e outras variáveis obrigatórios. Após criado o arquivo, será executado o comando de instalação do NovoSGA (criação de tabelas e dados básicos).

```sh
# alterar conexao de acordo com ambiente local
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=8.0&charset=utf8mb4"' > .env.local
echo 'LANGUAGE="pt_BR"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
echo 'MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!"' >> .env.local

php bin/console novosga:install
```


## Iniciar servidor web de desenvolvimento

Primeiro é necessário baixar o Symfony CLI

```
curl -sS https://get.symfony.com/cli/installer | bash
mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
```

Depois de iniciado o servidor de desenvolvimento basta abrir a URL [127.0.0.1:8000](http://127.0.0.1:8000/)

```sh
symfony server:start
```
