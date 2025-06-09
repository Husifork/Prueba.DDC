targetScope = 'resourceGroup'

param location string = resourceGroup().location
param environment string //necesario aunque no se use directamente acá, se usa en el parameters.json
param storageAccountName1 string
param storageAccountName2 string
param storageAccountName3 string
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param appServiceAdministracion2 string


module storagePortal1 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage1'
  params: {
    location: location
    storageAccountName: storageAccountName1
  }
}

module storagePortal2 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage2'
  params: {
    location: location
    storageAccountName: storageAccountName2
  }
}

module storagePortal3 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage3'
  params: {
    location: location
    storageAccountName: storageAccountName3
  }
}

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

  module appService2 'modules/appService/appService.bicep' = {
  name: 'deployAppService2'
  params: {
    location: location
    appServiceName: appServiceAdministracion2
    appServicePlanName: appServicePlanNameAdministracion
      }
  dependsOn: [
    appServicePlan
  ]
}
