targetScope = 'resourceGroup'

param location string = resourceGroup().location
param storageAccountName1 string
param storageAccountName2 string
param storageAccountName3 string
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param appServicePlanResourceGroup string


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

module appService1 'modules/appService/appServicePR.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServicePlanResourceGroup: appServicePlanResourceGroup
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion
    
   }
}
