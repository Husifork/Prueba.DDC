Repositorio destinado a la creación de la IaC del proyecto del portal "Administración.

Preparar el ambiente de despliegue:
1. Crear el SP (Service Principal) en el tenant y suscripción de DDC:

   az ad sp create-for-rbac --name "SP-DDCPORTALES-QA-001" --role Contributor --scopes /subscriptions/966c75c4-8c78-4066-97bf-db2afea37838 --sdk-auth

2. Debe dar de resultado una estructura así: 
    {
      "clientId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "clientSecret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      "subscriptionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      ...
    }
3. Guardar el resultado y pegarlo en Setting/secrets/environment de GitHub.


