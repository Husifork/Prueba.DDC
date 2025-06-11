targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param storageAccountName1 string
param storageAccountName2 string
param storageAccountName3 string
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module storagePortal1 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage1'
  params: {
    location: location
    storageAccountName: storageAccountName1
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module storagePortal2 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage2'
  params: {
    location: location
    storageAccountName: storageAccountName2
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module storagePortal3 'modules/storageAccount/storageAccount.bicep' = {
  name: 'deployStorage3'
  params: {
    location: location
    storageAccountName: storageAccountName3
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module appServicePlan 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion
    tagproyecto: tagproyecto
    tagambiente: tagambiente

   }
     dependsOn: [
    appServicePlan
  ]
}

module staticWebAppQA 'modules/staticWebApp/staticWebApp.bicep' = {
  name: 'staticWebAppPR'
  params: {
    staticWebAppName: staticwebAppPRName
    location: location
    skuName: staticwebAppPRsku
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    repositoryUrl: staticwebAppPRrepo
    branch: staticwebAppPRbranch
    provider: staticwebAppPRprovider
  }
}
