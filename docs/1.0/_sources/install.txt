.. _install:

Instalação
==================

A parte web do Novo SGA possui como requisito principal o PHP 5.3 (ou superior), com módulo PDO instalado, um servidor HTTP (Apache2, Nginx, etc), além de um dos bancos de dados a seguir: PostgreSQL 8+, MySQL 5+ ou MS SQL.

Nessa documentação será abordada a instalação do PHP 5.3 no Apache2, e utilizando o PostgreSQL 9 como banco de dados, na plataforma Linux (distribuições baseadas em Debian).


Baixando e instalando
---------------------

Para distribuíções baseadas em Debian/Ubuntu:

.. code-block:: bash

    $ sudo apt-get install postgresql libapache2-mod-php5 php5-pgsql curl php5-mcrypt


Outro passo fundamental é instalar o Composer para pode baixar e instalar automaticamente as dependências do projeto.

.. code-block:: bash

    $ curl -sS https://getcomposer.org/installer | php
    $ mv composer.phar /usr/local/bin/composer

.. warning::

    Caso o comando **curl** não esteja instalado: $ sudo apt-get install curl
    

Baixando e instalando o projeto:

.. code-block:: bash

    $ cd /var/www
    $ composer create-project novosga/novosga novosga "1.*"
    

Após término da operação, dar acesso ao usuário do Apache no diretório do projeto:

.. code-block:: bash

    $ sudo chown www-data:www-data /var/www/novosga


Por fim, habilitar o módulo rewrite do Apache2:

.. code-block:: bash

    $ sudo a2enmod rewrite



Instalador Web
---------------

Depois de concluir a etapa de instalação as dependências, agora basta apenas acessar a aplicação via navegador web e seguir os passos do instalador web: http://<servidor>/novosga/public.

Segue abaixo os screenshots das etapas do instalador:


Painel
-------

Com o Painel Web, basta baixar e extrair o pacote zip a partir do link a seguir: https://github.com/novosga/painel-web/archive/master.zip

Extraia o pacote no diretório www (htdocs, inetpub, etc.) do seu servidor HTTP (no caso do Apache2 em /var/www) e acesse http://<nome_do_servidor>/painel-web-master.

Com o painel carregado aparecerá no canto superior direito o menu com o item Configuração. Ao clicar no mesmo aparecerá uma janela para informar a URL do Novo SGA:


.. warning::

    A URL do Novo SGA é a mesma utilizada para acessar o sistema, aonde aponta para o diretório novosga/public.

    **Ex**: http://<nome_do_servidor_do_novosga>/novosga/public


Ao sair do campo, e caso a URL informada esteja correta (abra antes em uma nova aba para ver se está correta), no campo abaixo serão carregadas todas as Unidades disponíveis, e por sua vez, ao **selecionar uma Unidade**, exibirá abaixo todos os seus **serviços**.

Feito isso, basta clicar em Salvar.


.. sectionauthor:: Rogério Lino <rogeriolino@gmail.com>