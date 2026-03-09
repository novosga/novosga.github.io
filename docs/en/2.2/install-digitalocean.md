# Installation via DigitalOcean 1-Click App

Novo SGA is available as a 1-Click App on the DigitalOcean Marketplace, allowing you to deploy the system with just a few clicks, without any manual server configuration.

## Prerequisites

- A [DigitalOcean](https://www.digitalocean.com/) account

## Installation

Go to the Novo SGA page on the DigitalOcean Marketplace:

[https://marketplace.digitalocean.com/apps/novosga](https://marketplace.digitalocean.com/apps/novosga)

Click the **Create Novo SGA Droplet** button to start creating the Droplet.

Select the plan, region and other desired settings, then click **Create Droplet**.

Wait until the Droplet is created and becomes available.

## Access

After the Droplet is created, access the system from your browser using the Droplet's IP address:

    http://<droplet-ip>

On the first access, the installation wizard will be displayed to configure the database, create the administrator user and the initial data.

!> It is recommended to configure HTTPS before using the system in production.
