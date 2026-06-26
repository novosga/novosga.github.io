# API

Rotas da API do NovoSGA.

## Autenticação

| Método | URI | Descrição |
| --- | --- | --- |
| POST | /api/token | Autentica o usuário retornando o token de acesso. |

## Consultas

| Método | URI | Descrição |
| --- | --- | --- |
| GET | /api/unidades | Retorna todas as unidades disponíveis. |
| GET | /api/prioridades | Retorna todas as prioridades disponíveis. |
| GET | /api/servicos | Retorna os serviços globais. |
| GET | /api/locais | Retorna os locais de atendimentos. |
| GET | /api/usuarios | Retorna os usuários do sistema. |

## Senhas

| Método | URI | Descrição |
| --- | --- | --- |
| POST | /api/distribui | Distribui uma nova senha para atendimento. Requer autenticação. |
| POST | /api/distribui/agendamento | Distribui uma senha agendada via API. Requer autenticação. |
| GET | /api/print | Imprime uma senha. Requer autenticação e hash da senha. |

## Atendimento

A partir da versão 2.3, é possível gerenciar o ciclo completo de atendimento via API.

| Método | URI | Descrição |
| --- | --- | --- |
| POST | /api/atendimento/chamar | Chama a próxima senha da fila. Requer autenticação. |
| POST | /api/atendimento/iniciar | Inicia o atendimento de uma senha chamada. Requer autenticação. |
| POST | /api/atendimento/encerrar | Encerra o atendimento em curso. Requer autenticação. |

## Clientes

A partir da versão 2.3, é possível gerenciar clientes via API.

| Método | URI | Descrição |
| --- | --- | --- |
| GET | /api/clientes | Lista os clientes cadastrados. Requer autenticação. |
| POST | /api/clientes | Cadastra um novo cliente. Requer autenticação. |
| GET | /api/clientes/{id} | Retorna um cliente pelo ID. Requer autenticação. |
| PUT | /api/clientes/{id} | Atualiza os dados de um cliente. Requer autenticação. |
| DELETE | /api/clientes/{id} | Remove um cliente. Requer autenticação. |

## Mercure (mensagens em tempo real)

O NovoSGA utiliza o protocolo Mercure para notificações em tempo real. A partir da versão 2.3, as mensagens publicadas incluem o campo `@type` para identificação do tópico da mensagem, facilitando a integração com clientes que consomem o hub Mercure.
