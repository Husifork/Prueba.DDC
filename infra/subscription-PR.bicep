targetScope = 'subscription'

//param environment string 1 
param appServicePlanNameAdministracion1 string
param appServicePlanNameAdministracion2 string
param appServiceAdministracion1 string
param appServiceAdministracion2 string
param location string
param tagproyecto string
param tagambiente string
param storageAccountName1 string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module pr 'main-rsgr-pr-admin-001.bicep' = {
  name: 'deployToRSGR-PR-ADMIN-001'
  scope: resourceGroup('RSGR-PR-GESTORCARGA-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameAdministracion1: appServicePlanNameAdministracion1
        appServicePlanNameAdministracion2: appServicePlanNameAdministracion2
        appServiceAdministracion1: appServiceAdministracion1
        appServiceAdministracion2: appServiceAdministracion2
        storageAccountName1: storageAccountName1
        staticwebAppPRName : staticwebAppPRName
        staticwebAppPRsku : staticwebAppPRsku
        staticwebAppPRrepo : staticwebAppPRrepo
        staticwebAppPRbranch  : staticwebAppPRbranch
        staticwebAppPRprovider : staticwebAppPRprovider
  }
}
