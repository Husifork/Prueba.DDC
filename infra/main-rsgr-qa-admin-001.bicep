targetScope = 'resourceGroup'

param location string = resourceGroup().location
param appServicePlanNameAdministracion string
param appServicePlanAdministraciontag object
param appServiceAdministracion1 string
param appServiceAdministracion1tag object
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQAtag string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string

module appServicePlan 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion
    tags: appServicePlanAdministraciontag 
  }
}

 module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion
    tags:appServiceAdministracion1tag

      }
  dependsOn: [
    appServicePlan
  ]

}

module staticWebAppQA 'modules/staticWebApp/staticWebApp.bicep' = {
  name: 'staticWebAppQA'
  params: {
    staticWebAppName: staticwebAppQAName
    location: location
    skuName: staticwebAppQAsku
    tag: staticwebAppQAtag
    repositoryUrl: staticwebAppQArepo
    branch: staticwebAppQAbranch
    provider: staticwebAppQAprovider
  }
}
