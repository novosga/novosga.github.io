# Panel

## Built-in Panel

As of version 2.3, NovoSGA includes a native panel module. Panels are created and managed by the system administrator in the [Administration > Panels](administration.md#panels) section.

Each panel has a unique public URL generated automatically, accessible without authentication:

    http://your-server/painel/{uuid}

The panel displays in real-time the tickets called by attendants, using the integrated Mercure to receive updates.

## Web Panel (external application)

The Web Panel is an external application responsible for displaying the tickets called by the attendant.

### Installation

To install, just download the [latest available version](https://github.com/novosga/painel-web/releases) for your platform, Linux or Windows, extract it, and then run the binary.

### Configuration

| Field         | Description                                                                                |
| ------------- | ------------------------------------------------------------------------------------------ |
| Server        | NovoSGA URL (Ex: http://127.0.0.1)                                                        |
| User          | Username with access to NovoSGA                                                           |
| Password      | Password of the informed user                                                              |
| Client ID     | Client ID generated in the [system administration](administration?id=web-api) (Web API)    |
| Client Secret | Client secret generated in the [system administration](administration?id=web-api) (Web API) |
| Unity         | Panel's service unit                                                                    |
| Services      | Which services will be called on the panel                                                 |
| Alert         | Alert sound to play when a new ticket is called                                            |


### Github

The entire source code of the Web Panel is available on Github. Visit https://github.com/novosga/painel-web
