targetScope = 'subscription'

//param environment string  
param location string
param tagproyecto string
param tagambiente string
param appServicePlanNameCredenciales string
param appServiceCredenciales string
param appServiceCredencialeskind string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module pr 'main-rsgr-pr-credenciales-001.bicep' = {
  name: 'deployToRSGR-PR-PTLPRODUCTORES-001'
  scope: resourceGroup('RSGR-PR-PTLPRODUCTORES-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameCredenciales : appServicePlanNameCredenciales
        appServiceCredenciales : appServiceCredenciales
        appServiceCredencialeskind : appServiceCredencialeskind
        staticwebAppPRName : staticwebAppPRName
        staticwebAppPRsku : staticwebAppPRsku
        staticwebAppPRrepo : staticwebAppPRrepo
        staticwebAppPRbranch  : staticwebAppPRbranch
        staticwebAppPRprovider : staticwebAppPRprovider

  }
}
