# keycloak with angular

- instead of using keycloak-js adapter, can use even a higher abstraction for angular.

## using angular-keycloak

```shell
npm i --save keycloak-angular

# install peer dependency, use same version as server
npm i --save keycloak-js@9.0.2
```

- app.authguard.ts

```typescript
export class AppAuthGuard extends KeycloakAuthGuard implements CanActivate
```


- AppModule
