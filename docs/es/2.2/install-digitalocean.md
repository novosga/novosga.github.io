# Instalación mediante DigitalOcean 1-Click App

NovoSGA está disponible como una aplicación 1-Click en el marketplace de DigitalOcean, lo que le permite implementar el sistema con solo unos pocos clics, sin necesidad de configuración manual del servidor.

## Requisitos previos

- Una cuenta en [DigitalOcean](https://www.digitalocean.com/)

## Instalación

Acceda a la página de NovoSGA en el marketplace de DigitalOcean:

[https://marketplace.digitalocean.com/apps/novosga?refcode=6062eee28f2d&action=deploy](https://marketplace.digitalocean.com/apps/novosga?refcode=6062eee28f2d&action=deploy)

Haga clic en el botón **Create NovoSGA Droplet** para comenzar a crear el Droplet.

Seleccione el plan, la región y otras configuraciones deseadas, luego haga clic en **Create Droplet**.

Espere hasta que el Droplet sea creado y esté disponible.

## Acceso

Después de crear el Droplet, acceda al sistema desde su navegador usando la dirección IP del Droplet:

    http://<ip-del-droplet>

Utilice las credenciales predeterminadas para acceder al sistema:

- **Usuario:** `admin`
- **Contraseña:** `123456`

!> Se recomienda configurar HTTPS antes de utilizar el sistema en producción.
