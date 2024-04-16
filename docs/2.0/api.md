# API

Rotas da API do Novo SGA.

| Método | URI | Descrição |
| --- | --- | --- |
| POST | /api/token | Autentica o usuário retornando o token de acesso. |
| GET | /api/unidades | Retorna todas as unidades disponíveis. |
| GET | /api/prioridades | Retorna todas as prioridades disponíveis. |
| GET | /api/servicos | Retorna os serviços globais. |
| GET | /api/locais | Retorna os locais de atendimentos. |
| GET | /api/usuarios | Retorna os usuários do sistema. |
| POST | /api/distribui | Distribui uma nova senha para atendimento. Requer autenticação, um access_token válido e ativo. |
| GET | /api/print | Print a ticket. Requer autenticação, um access_token válido e ativo, um hash. |
