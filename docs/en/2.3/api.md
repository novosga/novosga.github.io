# API

NovoSGA API routes.

## Authentication

| Method | URI | Description |
| --- | --- | --- |
| POST | /api/token | Authenticates the user and returns the access token. |

## Queries

| Method | URI | Description |
| --- | --- | --- |
| GET | /api/unidades | Returns all available units. |
| GET | /api/prioridades | Returns all available priorities. |
| GET | /api/servicos | Returns the global services. |
| GET | /api/locais | Returns the service locations. |
| GET | /api/usuarios | Returns the system users. |

## Tickets

| Method | URI | Description |
| --- | --- | --- |
| POST | /api/distribui | Distributes a new ticket for service. Requires authentication. |
| POST | /api/distribui/agendamento | Issues a scheduled ticket via API. Requires authentication. |
| GET | /api/print | Prints a ticket. Requires authentication and ticket hash. |

## Attendance

As of version 2.3, it is possible to manage the full attendance cycle via API.

| Method | URI | Description |
| --- | --- | --- |
| POST | /api/atendimento/chamar | Calls the next ticket in the queue. Requires authentication. |
| POST | /api/atendimento/iniciar | Starts attendance for a called ticket. Requires authentication. |
| POST | /api/atendimento/encerrar | Finishes the current attendance. Requires authentication. |

## Customers

As of version 2.3, it is possible to manage customers via API.

| Method | URI | Description |
| --- | --- | --- |
| GET | /api/clientes | Lists registered customers. Requires authentication. |
| POST | /api/clientes | Creates a new customer. Requires authentication. |
| GET | /api/clientes/{id} | Returns a customer by ID. Requires authentication. |
| PUT | /api/clientes/{id} | Updates a customer's data. Requires authentication. |
| DELETE | /api/clientes/{id} | Removes a customer. Requires authentication. |

## Mercure (real-time messages)

NovoSGA uses the Mercure protocol for real-time notifications. As of version 2.3, published messages include the `@type` field for topic identification, making it easier to integrate with clients consuming the Mercure hub.
