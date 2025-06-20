targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNameVisualizador string
param appServiceVisualizador string
param appServiceVisualizadorkind string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module appServicePlan1 'modules/appServicePlan/appServicePlan.bicep' = {
  name: 'deployAppServicePlanCredencialesPR'
  params: {
    location: location
    appServicePlanName: appServicePlanNameVisualizador
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: 'app'
    reserved: false  
  }
}


module appService1 'modules/appService/appService_windows.bicep' = {
  name: 'deployAppServiceCredencialesPR'
  params: {
    location: location
    appServiceName: appServiceVisualizador
    appServicePlanName: appServicePlanNameVisualizador
    virtualNetworkSubnetId: '' //vnet.outputs.appSubnetId
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    netFrameworkVersion: 'v8.0' //.NET 8.0
    kind: appServiceVisualizadorkind
    minTlsCipherSuite: 'TLS_RSA_WITH_AES_128_CBC_SHA'
    reserved: false 
    CURRENT_STACK: 'dotnet'
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

