# Instalación mediante DigitalOcean 1-Click App

Novo SGA está disponible como una aplicación 1-Click en el marketplace de DigitalOcean, lo que le permite implementar el sistema con solo unos pocos clics, sin necesidad de configuración manual del servidor.

## Requisitos previos

- Una cuenta en [DigitalOcean](https://www.digitalocean.com/)

## Instalación

Acceda a la página de Novo SGA en el marketplace de DigitalOcean:

[https://marketplace.digitalocean.com/apps/novosga](https://marketplace.digitalocean.com/apps/novosga)

Haga clic en el botón **Create Novo SGA Droplet** para comenzar a crear el Droplet.

Seleccione el plan, la región y otras configuraciones deseadas, luego haga clic en **Create Droplet**.

Espere hasta que el Droplet sea creado y esté disponible.

## Acceso

Después de crear el Droplet, acceda al sistema desde su navegador usando la dirección IP del Droplet:

    http://<ip-del-droplet>

En el primer acceso, se mostrará el asistente de instalación para configurar la base de datos, crear el usuario administrador y los datos iniciales.

!> Se recomienda configurar HTTPS antes de utilizar el sistema en producción.
