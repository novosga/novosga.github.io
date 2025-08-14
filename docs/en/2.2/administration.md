# Administration

## System

Global system configuration. In this section, it is possible to reset all tickets (moving them to the history) and/or delete all service data for a new system start.

## Unities

Registration of the system's service units. A service unit is the physical location where services are performed. For example: A health unit, a customer service department, or a locality.

## Services

Registration of the services that are performed in the system. The service is a global registration, and may or may not be available in the registered units. The same service can be provided in more than one unit.

## Profiles

Registration of system access profiles. A profile defines which modules users can access. The relationship between the profile and the user is through the `assignment`, which is the access configuration of a user to a `unit` for the chosen `profile`.

## Priorities

Registration of service priorities. By default, there are two registered priorities: `No priority` and `Priority`. The priority has a `weight` field that influences the order of the queue. By default, `No priority` has a weight of `0` and `Priority` has a weight of `1`.

## Locations

Registration of the locations where the attendant performs their service. The location serves to guide the client so that they know where to go when called. For example: Counter, room, table.

## Modules

View of available modules. It is possible to enable and disable installed modules.

## Web API

Registration of `OAuth2` clients for integration with other applications via the system's web API.
