targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNameCredenciales string
param appServiceCredenciales string
param appServiceCredencialeskind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


module appServicePlan 'modules/appServicePlan/appServicePlan.bicep' = {
  name: 'deployAppServicePlanCredencialesQA'
  params: {
    location: location
    appServicePlanName: appServicePlanNameCredenciales
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: 'app'
    reserved: true
  }
}

 module appService1 'modules/appService/appService_windows.bicep' = {
  name: 'deployAppServiceCredencialesQA'
  params: {
    location: location
    appServiceName: appServiceCredenciales
    appServicePlanName: appServicePlanNameCredenciales
    virtualNetworkSubnetId: ''
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    netFrameworkVersion: 'v8.0'
    kind: appServiceCredencialeskind
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

