# Desenvolvimento

Veja abaixo como montar um ambiente de desenvolvimento utilizando Docker.

## Clonar projeto

```sh
git clone -b v2.1 https://github.com/novosga/novosga.git
cd novosga/
```

## Iniciar container

Rodar o comando abaixo dentro do diretório do novosga, que será compartilhado via volume:

```sh
docker run --name=novosga-21-dev -it -v './:/var/www/app' -p 8000:8000 php:7.2.34-cli /bin/bash
```

Uma vez criado o container, quando quiser iniciá-lo novamente, basta utilizar o nome informado no comando anterior:

```sh
docker start novosga-21-dev -ai
```

## Preparar container

Só precisa executar essa etapa na primeira vez que criar o container.

```sh
# atualizar source.list
sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list

# instalar extensoes necessarias
apt-get update
apt-get install zlib1g-dev zip -y
docker-php-ext-install zip pdo pdo_mysql

# composer
cd /var/www/app
curl -fSL https://getcomposer.org/download/1.10.27/composer.phar -o composer.phar
php composer.phar install
```

## Configuração do NovoSGA

!> A partir do Symfony 5, não existe mais o arquivo `.env.dist`, que foi renomado para `.env` e para configurações locais deve utilizar `.env.local`

Criar arquivo `.env.local` com a URL de conexão com o banco de dados, e outras variáveis obrigatórios. Após criado o arquivo, será executado o comando de instalação do NovoSGA (criação de tabelas e dados básicos).

```sh
# alterar conexao de acordo com ambiente local
echo 'DATABASE_URL="mysql://db_user:db_pass@172.17.0.1:3306/db_name?serverVersion=5.7&charset=utf8"' > .env.local
echo 'LANGUAGE="pt_BR"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
echo 'APP_ENV="dev"' >> .env.local
# Endereço Mercure para publicar mensagem (onde "mercure" é o nome do host)
# esse endereço será chamado internamente via o PHP
echo 'MERCURE_PUBLIC_URL=http://mercure:3000/.well-known/mercure' >> .env.local
# Endereço Mercure para consumir mensagem
# esse endereço será chamado via o navegador web
echo 'MERCURE_CONSUMER_URL=http://127.0.0.1:3000/.well-known/mercure' >> .env.local

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

