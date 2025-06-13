targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNamePortalProductores string
param appServicePortalProductoresApi string
param appServicePortalProductoreskind string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module appServicePlan1 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan1'
  params: {
    location: location
    appServicePlanName: appServicePlanNamePortalProductores
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServicePortalProductoreskind
    reserved: true  
  }
}


module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppServiceGestorDocumental'
  params: {
    location: location
    appServiceName: appServicePortalProductoresApi
    appServicePlanName: appServicePlanNamePortalProductores
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServicePortalProductoreskind
    reserved: true
   }
     dependsOn: [
    appServicePlan1
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

