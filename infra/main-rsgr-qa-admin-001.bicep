targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNamePortalProductores string
param appServicePortalProductoresApi string
param appServicePortalProductores string
param appServicePortalProductoreskind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


module appServicePlan 'modules/appServicePlan/appServicePlan.bicep' = {
  name: 'deployAppServicePlanPortalProductores'
  params: {
    location: location
    appServicePlanName: appServicePlanNamePortalProductores
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: 'linux'
    reserved: true
  }
}

 module appService1 'modules/appService/appService_linux.bicep' = {
  name: 'deployAppServicePortalProductoresApiQA'
  params: {
    location: location
    appServiceName: appServicePortalProductoresApi
    appServicePlanName: appServicePlanNamePortalProductores
    virtualNetworkSubnetId: ''
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    runtime: 'DOTNETCORE|8.0' //.NET 8.0
    kind: appServicePortalProductoreskind
    reserved: true
  }
    dependsOn: [
    appServicePlan
  ]
}

 module appService2 'modules/appService/appService_linux.bicep' = {
  name: 'deployAppService2'
  params: {
    location: location
    appServiceName: appServicePortalProductores
    appServicePlanName: appServicePlanNamePortalProductores
    virtualNetworkSubnetId: ''
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    runtime: 'DOTNETCORE|8.0' //DOTNET|8.0 //.NET 8.0
    kind: appServicePortalProductoreskind
    reserved: true
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
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    repositoryUrl: staticwebAppQArepo
    branch: staticwebAppQAbranch
    provider: staticwebAppQAprovider
  }
}

