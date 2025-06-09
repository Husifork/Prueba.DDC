targetScope = 'subscription'

param deployments array

module deploymentsModules 'main.bicep' = [for d in deployments: {
  name: 'deployTo${d.resourceGroupName}'
  scope: resourceGroup(d.resourceGroupName)
  params: {
    location: d.parameters.location.value
    environment: d.parameters.environment.value
    storageAccountName1: d.parameters.storageAccountName1.value
    storageAccountName2: d.parameters.storageAccountName2.value
    appServicePlanNameAdministracion: d.parameters.appServicePlanNameAdministracion.value
    appServiceAdministracion: d.parameters.appServiceAdministracion.value
  }
}]
