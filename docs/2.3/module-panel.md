# Módulo de Painel

A partir da versão 2.3, o NovoSGA inclui um módulo de painel nativo. Os painéis são criados e gerenciados pelo administrador do sistema na seção [Administração > Painéis](administration.md#painéis).

Cada painel possui uma URL pública única gerada automaticamente, acessível sem autenticação:

    http://seu-servidor/painel/{uuid}

O painel exibe em tempo real as senhas chamadas pelos atendentes, utilizando o Mercure integrado para receber as atualizações.

## Configuração

Ao cadastrar um painel, não é necessário informar credenciais de usuário. Basta preencher:

| Campo    | Descrição                                                        |
| -------- | ------------------------------------------------------------------ |
| Nome     | Nome de identificação do painel                                  |
| Serviços | Quais serviços da unidade serão chamados no painel                |
| Logo     | URL de uma logo customizada para exibição no painel (opcional)    |
| Cores    | Cores de destaque, rodapé, histórico e relógio (opcional)         |

### Github

Todo o código-fonte do módulo de painel está disponível no Github. Visite https://github.com/novosga/panel-bundle
