targetScope = 'subscription'

//param environment string 1 
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param location string
param storageAccountName1 string
param storageAccountName2 string
param storageAccountName3 string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRtag string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module pr 'main-rsgr-pr-admin-001.bicep' = {
  name: 'deployToRSGR-PR-ADMIN-001'
  scope: resourceGroup('RSGR-PR-ADMIN-001')
  params: {
        location: location
        appServicePlanNameAdministracion: appServicePlanNameAdministracion
        appServiceAdministracion1: appServiceAdministracion1
        storageAccountName1: storageAccountName1
        storageAccountName2: storageAccountName2
        storageAccountName3: storageAccountName3
        staticwebAppPRName : staticwebAppPRName
        staticwebAppPRsku : staticwebAppPRsku
        staticwebAppPRtag : staticwebAppPRtag
        staticwebAppPRrepo : staticwebAppPRrepo
        staticwebAppPRbranch  : staticwebAppPRbranch
        staticwebAppPRprovider : staticwebAppPRprovider
  }
}
