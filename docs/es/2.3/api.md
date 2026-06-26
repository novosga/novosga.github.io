# API

Rutas de la API de NovoSGA.

## Autenticación

| Método | URI | Descripción |
| --- | --- | --- |
| POST | /api/token | Autentica al usuario y devuelve el token de acceso. |

## Consultas

| Método | URI | Descripción |
| --- | --- | --- |
| GET | /api/unidades | Devuelve todas las unidades disponibles. |
| GET | /api/prioridades | Devuelve todas las prioridades disponibles. |
| GET | /api/servicos | Devuelve los servicios globales. |
| GET | /api/locais | Devuelve las ubicaciones de los servicios. |
| GET | /api/usuarios | Devuelve los usuarios del sistema. |

## Tickets

| Método | URI | Descripción |
| --- | --- | --- |
| POST | /api/distribui | Distribuye un nuevo ticket para el servicio. Requiere autenticación. |
| POST | /api/distribui/agendamento | Emite un ticket programado mediante API. Requiere autenticación. |
| GET | /api/print | Imprime un ticket. Requiere autenticación y hash del ticket. |

## Atención

A partir de la versión 2.3, es posible gestionar el ciclo completo de atención mediante API.

| Método | URI | Descripción |
| --- | --- | --- |
| POST | /api/atendimento/chamar | Llama al siguiente ticket de la cola. Requiere autenticación. |
| POST | /api/atendimento/iniciar | Inicia la atención de un ticket llamado. Requiere autenticación. |
| POST | /api/atendimento/encerrar | Finaliza la atención en curso. Requiere autenticación. |

## Clientes

A partir de la versión 2.3, es posible gestionar clientes mediante API.

| Método | URI | Descripción |
| --- | --- | --- |
| GET | /api/clientes | Lista los clientes registrados. Requiere autenticación. |
| POST | /api/clientes | Crea un nuevo cliente. Requiere autenticación. |
| GET | /api/clientes/{id} | Devuelve un cliente por ID. Requiere autenticación. |
| PUT | /api/clientes/{id} | Actualiza los datos de un cliente. Requiere autenticación. |
| DELETE | /api/clientes/{id} | Elimina un cliente. Requiere autenticación. |

## Mercure (mensajes en tiempo real)

NovoSGA utiliza el protocolo Mercure para notificaciones en tiempo real. A partir de la versión 2.3, los mensajes publicados incluyen el campo `@type` para la identificación del tema del mensaje, facilitando la integración con clientes que consumen el hub Mercure.
