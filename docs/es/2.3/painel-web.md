# Panel

## Panel Integrado

A partir de la versión 2.3, NovoSGA incluye un módulo de panel nativo. Los paneles son creados y gestionados por el administrador del sistema en la sección [Administración > Paneles](administration.md#paneles).

Cada panel tiene una URL pública única generada automáticamente, accesible sin autenticación:

    http://su-servidor/painel/{uuid}

El panel muestra en tiempo real los tickets llamados por los asistentes, utilizando el Mercure integrado para recibir las actualizaciones.

## Panel Web (aplicación externa)

El Panel Web es una aplicación externa responsable de mostrar los tickets llamados por el asistente.

### Instalación

Para instalar, simplemente descargue la [última versión disponible](https://github.com/novosga/painel-web/releases) para su plataforma, Linux o Windows, extráigala y luego ejecute el binario.

### Configuración

| Campo         | Descripción                                                                                |
| ------------- | ------------------------------------------------------------------------------------------ |
| Servidor      | URL de NovoSGA (Ej: http://127.0.0.1)                                                     |
| Usuario       | Nombre de usuario con acceso a NovoSGA                                                    |
| Contraseña    | Contraseña del usuario informado                                                           |
| ID de cliente | ID de cliente generado en la [administración del sistema](administration?id=web-api) (Web API) |
| Secreto del cliente | Secreto del cliente generado en la [administración del sistema](administration?id=web-api) (Web API) |
| Unidad        | Unidad de servicio del panel                                                               |
| Servicios     | Qué servicios se llamarán en el panel                                                      |
| Alerta        | Sonido de alerta para reproducir cuando se llama un nuevo ticket                             |


### Github

Todo el código fuente del Panel Web está disponible en Github. Visite https://github.com/novosga/painel-web
