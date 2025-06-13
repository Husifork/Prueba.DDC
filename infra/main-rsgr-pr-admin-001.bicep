targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param storageAccountName1 string
param appServicePlanNameGestorDocApi string
param appServicePlanNameGestorDocumental string
param appServicegestordocapi string
param appServicegestordocapikind string
param appServiceGestorDocumental string
param appServiceGestorDocumentalkind string
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
    appServicePlanName: appServicePlanNameGestorDocumental
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServiceGestorDocumentalkind
    reserved: true  
  }
}

module appServicePlan2 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan2'
  params: {
    location: location
    appServicePlanName: appServicePlanNameGestorDocApi
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServicegestordocapikind
    reserved: false
  }
}

module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppServiceGestorDocumental'
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
    appServicePlan1
  ]
}

module appService2 'modules/appService/appService.bicep' = {
  name: 'deployAppServicegestordocapi1'
  params: {
    location: location
    appServiceName: appServicegestordocapi
    appServicePlanName: appServicePlanNameGestorDocApi
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    kind: appServicegestordocapikind
    reserved: false
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

