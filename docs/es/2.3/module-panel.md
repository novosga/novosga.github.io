# Módulo de panel

A partir de la versión 2.3, NovoSGA incluye un módulo de panel nativo. Los paneles son creados y gestionados por el administrador del sistema en la sección [Administración > Paneles](administration.md#paneles).

Cada panel tiene una URL pública única generada automáticamente, accesible sin autenticación:

    http://su-servidor/painel/{uuid}

El panel muestra en tiempo real los tickets llamados por los asistentes, utilizando el Mercure integrado para recibir las actualizaciones.

## Configuración

Al registrar un panel, no es necesario informar credenciales de usuario. Basta con completar:

| Campo     | Descripción                                                       |
| --------- | -------------------------------------------------------------------- |
| Nombre    | Nombre de identificación del panel                                 |
| Servicios | Qué servicios de la unidad se llamarán en el panel                 |
| Logo      | URL de un logo personalizado para mostrar en el panel (opcional)   |
| Colores   | Colores de destaque, pie de página, historial y reloj (opcional)   |

### Github

Todo el código fuente del módulo de panel está disponible en Github. Visite https://github.com/novosga/panel-bundle
