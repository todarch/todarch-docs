# wisit keycloak client

- realm: todarch
- client:
    - name: wisit-app
    - valid redirect uri: http://localhost:4200/*
    - web origins: http://localhost:4200
- roles:
    - user
