targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param storageAccountName1 string
param appServicePlanNameAdministracion1 string
param appServicePlanNameAdministracion2 string
param appServiceAdministracion1 string
param appServiceAdministracion2 string
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

module appServicePlan1 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan1'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion1
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module appServicePlan2 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan2'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion2
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion1
    tagproyecto: tagproyecto
    tagambiente: tagambiente

   }
     dependsOn: [
    appServicePlan1
  ]
}

module appService2 'modules/appService/appService.bicep' = {
  name: 'deployAppService2'
  params: {
    location: location
    appServiceName: appServiceAdministracion2
    appServicePlanName: appServicePlanNameAdministracion2
    tagproyecto: tagproyecto
    tagambiente: tagambiente

   }
     dependsOn: [
    appServicePlan2
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
