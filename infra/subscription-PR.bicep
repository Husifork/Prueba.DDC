targetScope = 'subscription'

//param environment string 1 
param location string
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


module pr 'main-rsgr-pr-admin-001.bicep' = {
  name: 'deployToRSGR-PR-PTLPRODUCTORES-001'
  scope: resourceGroup('RSGR-PR-PTLPRODUCTORES-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        vnetName: vnetName
        addressPrefix: addressPrefix
        gatewaySubnetName: gatewaySubnetName
        gatewaySubnetPrefix: gatewaySubnetPrefix
        appSubnetName: appSubnetName
        appSubnetPrefix: appSubnetPrefix
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
