targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param vnetName string
param addressPrefix string 
param gatewaySubnetName string 
param gatewaySubnetPrefix string 
param appSubnetName string 
param appSubnetPrefix string 
param appServicePlanNamePortalProductores string
param appServicePortalProductoresApi string
param appServicePortalProductoreskind string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string

module vnet 'modules/vnet/vnet.bicep' = {
  name: 'vnet'
  params: {
    vnetName: vnetName
    location: location
    addressPrefix: addressPrefix
    gatewaySubnetName: gatewaySubnetName
    gatewaySubnetPrefix: gatewaySubnetPrefix
    appSubnetName: appSubnetName
    appSubnetPrefix: appSubnetPrefix
    enableDelegation: true // o false, según si quieres la delegación
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}


module appServicePlan1 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan1'
  params: {
    location: location
    appServicePlanName: appServicePlanNamePortalProductores
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: 'app'
    reserved: false  
  }
}


module appService1 'modules/appService/appService_windows.bicep' = {
  name: 'deployAppServicePortalProductoresApi'
  params: {
    location: location
    appServiceName: appServicePortalProductoresApi
    appServicePlanName: appServicePlanNamePortalProductores
    virtualNetworkSubnetId: '' //vnet.outputs.appSubnetId
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    runtime: 'v8.0' //.NET 8.0
    kind: appServicePortalProductoreskind
    reserved: false 
   }
     dependsOn: [
    appServicePlan1
    vnet
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

