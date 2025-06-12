targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNameGestorDocumental string
param appServiceGestorDocumental string
param appServiceGestorDocumentalkind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


module appServicePlan 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanNameGestorDocumental
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServiceGestorDocumentalkind
    reserved: true
  }
}

 module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceGestorDocumental
    appServicePlanName: appServicePlanNameGestorDocumental
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServiceGestorDocumentalkind
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
