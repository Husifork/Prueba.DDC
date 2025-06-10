targetScope = 'resourceGroup'

param location string = resourceGroup().location
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string


module appServicePlan 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion
  }
}

 module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion

      }
  dependsOn: [
    appServicePlan
  ]

}
