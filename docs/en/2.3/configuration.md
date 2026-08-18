# Configuration

As of version 2.2, a user interface has been introduced to manage system settings.

## Appearance

It allows you to choose the theme and its variations from a list with more than 25 theme options. It is also possible to customize the logo image both in the navigation bar and on the login screen.

## Queue ordering

The system administrator can define exactly which fields will be used to define the order of the service queue.

## Behavior

In the behavior section, it is possible to configure the system to interleave between priority and normal tickets, preventing all priority tickets from being served first and then calling normal tickets.

It is also possible to enable or disable the function that allows the attendant to call any ticket regardless of the queue order (queue jumping).

As of version 2.3, behavior settings can be overridden per user, allowing each attendant to have individual settings that take precedence over the global system settings.

## Scheduling

### Time tolerance

Defines the tolerance window (in minutes) for issuing a scheduled ticket. When configured, the system checks whether the current time falls within the allowed time window relative to the scheduled appointment time.
