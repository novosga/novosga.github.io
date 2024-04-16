# Baixando e instalando

!> **Atenção** Você está vendo uma documentação antiga. A versão v1.0.0 foi lançada em Dezembro de 2013.

Para distribuíções baseadas em Debian/Ubuntu:

```sh
sudo apt-get install postgresql libapache2-mod-php5 php5-pgsql curl php5-mcrypt
```

Outro passo fundamental é instalar o Composer para pode baixar e instalar automaticamente as dependências do projeto.

```sh
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

!> Caso o comando curl não esteja instalado: $ sudo apt-get install curl

Baixando e instalando o projeto:

```sh
cd /var/www
composer create-project novosga/novosga novosga "1.*"
```

Após término da operação, dar acesso ao usuário do Apache no diretório do projeto:

```sh
sudo chown www-data:www-data /var/www/novosga
```

Por fim, habilitar o módulo rewrite do Apache2:

```sh
sudo a2enmod rewrite
```
