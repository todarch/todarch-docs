# keycloak config

- be sure user/pass env variables are set (ansible config)

```shell
dcp up -d keykloak
```

- visit id.todarch.com

## with database setup

- create its schema if not exist

```sql
CREATE SCHEMA keycloak;
```


### prod

- realm: todarch
- client:
    - name: todarch-app
    - valid redirect uri: https://todarch.com/*
    - web origins: https://todarch.com
- roles:
    - user

- visit keycloak running address -> administration console

* create a realm
    - hover over realm name on left top menu
    
* create a client (any app keycloak secures)
    - on left menu: clients
    - field: `Valid Redirect URIs`: `https://todarch.com/*`
    - field: `Web origin`: add values for CORS
    
* create a role
    - on the left menu: roles
    - `user`
    
* create a user
    - on the left menu: users
    - just type username
    - then on the tabs: credentials
        - set password, disable temporary password
    - roles mapping tab
        - add `user` role to user

## spring boot

- enable cors also through keycloak property

```properties
keycloak.cors=true
```

