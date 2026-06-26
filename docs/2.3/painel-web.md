# Painel

## Painel Integrado

A partir da versão 2.3, o NovoSGA inclui um módulo de painel nativo. Os painéis são criados e gerenciados pelo administrador do sistema na seção [Administração > Painéis](administration.md#painéis).

Cada painel possui uma URL pública única gerada automaticamente, acessível sem autenticação:

    http://seu-servidor/painel/{uuid}

O painel exibe em tempo real as senhas chamadas pelos atendentes, utilizando o Mercure integrado para receber as atualizações.

## Painel Web (aplicativo externo)

O Painel Web é um aplicativo externo responsável por exibir as senhas chamadas pelo atendente.

### Instalação

Para instalar bastar fazer download da [última versão disponível](https://github.com/novosga/painel-web/releases) para a sua plataforma, Linux ou Windows, extrair, e depois executar o binário.

### Configuração

| Campo         | Descrição                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------ |
| Servidor      | URL do NovoSGA (Ex: http://127.0.0.1)                                                     |
| Usuário       | Nome de usuário com acesso ao NovoSGA                                                     |
| Senha         | Senha do usuário informado                                                                 |
| Client ID     | ID do cliente gerado na [administração do sistema](administration?id=web-api) (Web API)    |
| Client Secret | Senha do cliente gerado na [administração do sistema](administration?id=web-api) (Web API) |
| Unidade       | Unidade de atendimento do painel                                                           |
| Serviços      | Quais serviços serão chamados no painel                                                    |
| Alerta        | Som de alerta para tocar quando uma nova senha é chamada                                   |


### Github

Todo o código-fonte do Painel Web está disponível no Github. Visite https://github.com/novosga/painel-web
