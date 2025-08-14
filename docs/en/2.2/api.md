# API

NovoSGA API routes.

| Method | URI | Description |
| --- | --- | --- |
| POST | /api/token | Authenticates the user and returns the access token. |
| GET | /api/unidades | Returns all available units. |
| GET | /api/prioridades | Returns all available priorities. |
| GET | /api/servicos | Returns the global services. |
| GET | /api/locais | Returns the service locations. |
| GET | /api/usuarios | Returns the system users. |
| POST | /api/distribui | Distributes a new ticket for service. Requires authentication, a valid and active access_token. |
| GET | /api/print | Print a ticket. Requires authentication, a valid and active access_token, and a hash. |
