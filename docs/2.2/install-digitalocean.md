# Instalação via DigitalOcean 1-Click App

O Novo SGA está disponível como um aplicativo 1-Click no marketplace da DigitalOcean, permitindo que você implante o sistema com apenas alguns cliques, sem necessidade de configuração manual do servidor.

## Pré-requisitos

- Conta na [DigitalOcean](https://www.digitalocean.com/)

## Instalação

Acesse a página do Novo SGA no marketplace da DigitalOcean:

[https://marketplace.digitalocean.com/apps/novosga](https://marketplace.digitalocean.com/apps/novosga)

Clique no botão **Create Novo SGA Droplet** para iniciar a criação do Droplet.

Selecione o plano, a região e as demais configurações desejadas, em seguida clique em **Create Droplet**.

Aguarde até que o Droplet seja criado e fique disponível.

## Acesso

Após a criação do Droplet, acesse o sistema pelo navegador utilizando o endereço IP do Droplet:

    http://<ip-do-droplet>

No primeiro acesso, o assistente de instalação será exibido para configurar o banco de dados, criar o usuário administrador e os dados iniciais.

!> Recomenda-se configurar HTTPS antes de utilizar o sistema em produção.
