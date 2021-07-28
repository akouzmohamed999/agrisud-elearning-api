[AGRISUD] AGRISUD-ELEARNING-API 
=============================
Gateway service for IBDAA back-end API.

Structure
--------

Overall structure in production environment:

```mermaid
graph TB
    ELEARNING-WEB --HTTPS--> keycloak
    MEDIATHEQUE-WEB --HTTPS--> keycloak
    SITE-WEB --HTTPS--> keycloak
    ELEARNING-WEB --HTTPS--> ELEARNING-API
    MEDIATHEQUE-WEB --HTTPS--> MEDIATHEQUE-API
    subgraph local user browser
        ELEARNING-WEB
        MEDIATHEQUE-WEB
        SITE-WEB
    end
    subgraph AGRISUD hosted services
        keycloak[(keycloak)]
        ELEARNING-API
        MEDIATHEQUE-API
    end
```
Note: The structure is simplified in development environment:  
- keycloak is bootstrapped with mocked users,
- there are no firewall and no HTTTPS between front apps and backends.

Dev environment
--------

to get started with all the tools you need to start working on IBDAA, click [here](./docs/getting-started.md)
