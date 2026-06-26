# Administración

## Sistema

Configuración global del sistema. En esta sección, es posible restablecer todos los tickets (moviéndolos al historial) y/o eliminar todos los datos de servicio para un nuevo inicio del sistema.

## Unidades

Registro de las unidades de servicio del sistema. Una unidad de servicio es la ubicación física donde se realizan los servicios. Por ejemplo: una unidad de salud, un departamento de servicio al cliente o una localidad.

A partir de la versión 2.3, cada unidad tiene un campo de **zona horaria** independiente, lo que permite que las unidades en diferentes regiones utilicen la hora local correcta para la generación y visualización de tickets.

## Servicios

Registro de los servicios que se realizan en el sistema. El servicio es un registro global, y puede o no estar disponible en las unidades registradas. El mismo servicio se puede proporcionar en más de una unidad.

## Perfiles

Registro de perfiles de acceso al sistema. Un perfil define a qué módulos pueden acceder los usuarios. La relación entre el perfil y el usuario es a través de la `asignación`, que es la configuración de acceso de un usuario a una `unidad` para el `perfil` elegido.

A partir de la versión 2.3, es posible configurar por asignación qué **tipos de ticket** puede emitir el asistente: solo normal, solo prioritario, solo programado, o cualquier combinación.

## Prioridades

Registro de prioridades de servicio. Por defecto, hay dos prioridades registradas: `Sin prioridad` y `Prioridad`. La prioridad tiene un campo de `peso` que influye en el orden de la cola. Por defecto, `Sin prioridad` tiene un peso de `0` y `Prioridad` tiene un peso de `1`.

## Ubicaciones

Registro de las ubicaciones donde el asistente realiza su servicio. La ubicación sirve para guiar al cliente para que sepa a dónde ir cuando lo llamen. Por ejemplo: mostrador, sala, mesa.

## Paneles

Registro de paneles de servicio integrados en el sistema. A partir de la versión 2.3, NovoSGA incluye un módulo de panel nativo que puede ser accedido públicamente, sin autenticación, a través de una URL única generada automáticamente.

Cada panel puede ser configurado para mostrar llamadas de servicios específicos de una determinada unidad.

## Módulos

Vista de los módulos disponibles. Es posible habilitar y deshabilitar los módulos instalados.

## Web API

Registro de clientes `OAuth2` para la integración con otras aplicaciones a través de la API web del sistema.
