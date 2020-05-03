# realm

- https://www.thomasvitale.com/keycloak-configuration-authentication-authorisation/

* create a realm
    - hover over realm name on left top menu

## roles

### create roles

- on the left menu: roles
    - `user`
    - `admin`

### default role

- let's say we create new role `user`
- people register to our application
- they will not have `user` role defined on their profile
- add that role as a default role of the realm so every new user will have that role

- on realm configuration menu, select `roles`, from tab `default roles`

- now when users register, they will have default role defined on their profile
