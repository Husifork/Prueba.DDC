targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNameVisualizador string
param appServiceVisualizador string
param appServiceVisualizadorkind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string 


module appServicePlan 'modules/appServicePlan/appServicePlan.bicep' = {
  name: 'deployAppServicePlanVisualizadorQA'
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
  name: 'deployAppServiceVisualizadorQA'
  params: {
    location: location
    appServiceName: appServiceVisualizador
    appServicePlanName: appServicePlanNameVisualizador
    virtualNetworkSubnetId: ''
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    netFrameworkVersion: 'v8.0'
    kind: appServiceVisualizadorkind
    minTlsCipherSuite: 'TLS_RSA_WITH_AES_128_CBC_SHA'
    reserved: false
    CURRENT_STACK: 'dotnet'
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

