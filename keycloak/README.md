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

- visit keycloak running address -> administration console

* create a realm
    - hover over realm name on left top menu
    
* create a client (any app keycloak secures)
    - on left menu: clients

