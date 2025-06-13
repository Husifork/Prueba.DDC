targetScope = 'subscription'

//param environment string 1 
param location string
param appServicePlanNamePortalProductores string
param appServicePortalProductoresApi string
param appServicePortalProductoreskind string
param tagproyecto string
param tagambiente string
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
        appServicePlanNamePortalProductores: appServicePlanNamePortalProductores
        appServicePortalProductoresApi: appServicePortalProductoresApi
        appServicePortalProductoreskind : appServicePortalProductoreskind
        staticwebAppPRName : staticwebAppPRName
        staticwebAppPRsku : staticwebAppPRsku
        staticwebAppPRrepo : staticwebAppPRrepo
        staticwebAppPRbranch  : staticwebAppPRbranch
        staticwebAppPRprovider : staticwebAppPRprovider

  }
}
