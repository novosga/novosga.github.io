# API

Rutas de la API de NovoSGA.

| Método | URI | Descripción |
| --- | --- | --- |
| POST | /api/token | Autentica al usuario y devuelve el token de acceso. |
| GET | /api/unidades | Devuelve todas las unidades disponibles. |
| GET | /api/prioridades | Devuelve todas las prioridades disponibles. |
| GET | /api/servicos | Devuelve los servicios globales. |
| GET | /api/locais | Devuelve las ubicaciones de los servicios. |
| GET | /api/usuarios | Devuelve los usuarios del sistema. |
| POST | /api/distribui | Distribuye un nuevo ticket para el servicio. Requiere autenticación, un access_token válido y activo. |
| GET | /api/print | Imprime un ticket. Requiere autenticación, un access_token válido y activo, y un hash. |
