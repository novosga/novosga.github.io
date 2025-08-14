# Web Panel

Web Panel is the application responsible for displaying the tickets called by the attendant.

## Installation

To install, just download the [latest available version](https://github.com/novosga/painel-web/releases) for your platform, Linux or Windows, extract it, and then run the binary.

## Configuration

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


## Github

The entire source code of the Web Panel is available on Github. Visit https://github.com/novosga/painel-web
