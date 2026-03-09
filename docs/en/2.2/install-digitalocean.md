# Installation via DigitalOcean 1-Click App

NovoSGA is available as a 1-Click App on the DigitalOcean Marketplace, allowing you to deploy the system with just a few clicks, without any manual server configuration.

## Prerequisites

- A [DigitalOcean](https://www.digitalocean.com/) account

## Installation

Go to the NovoSGA page on the DigitalOcean Marketplace:

[https://marketplace.digitalocean.com/apps/novosga?refcode=6062eee28f2d&action=deploy](https://marketplace.digitalocean.com/apps/novosga?refcode=6062eee28f2d&action=deploy)

Click the **Create NovoSGA Droplet** button to start creating the Droplet.

Select the plan, region and other desired settings, then click **Create Droplet**.

Wait until the Droplet is created and becomes available.

## Access

After the Droplet is created, access the system from your browser using the Droplet's IP address:

    http://<droplet-ip>

On the first access, the installation wizard will be displayed to configure the database, create the administrator user and the initial data.

The default login credentials are:

- **Username:** `admin`
- **Password:** `123456`

!> It is recommended to configure HTTPS before using the system in production.
