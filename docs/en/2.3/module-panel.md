# Panel module

As of version 2.3, NovoSGA includes a native panel module. Panels are created and managed by the system administrator in the [Administration > Panels](administration.md#panels) section.

Each panel has a unique public URL generated automatically, accessible without authentication:

    http://your-server/painel/{uuid}

The panel displays in real-time the tickets called by attendants, using the integrated Mercure to receive updates.

## Configuration

When registering a panel, no user credentials are required. Just fill in:

| Field    | Description                                                       |
| -------- | ------------------------------------------------------------------- |
| Name     | Panel's identification name                                       |
| Services | Which services of the unit will be called on the panel            |
| Logo     | URL of a custom logo to display on the panel (optional)           |
| Colors   | Highlight, footer, history and clock background colors (optional) |

### Github

The entire source code of the panel module is available on Github. Visit https://github.com/novosga/panel-bundle
