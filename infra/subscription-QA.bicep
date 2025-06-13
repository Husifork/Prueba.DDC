targetScope = 'subscription'

param location string
param tagproyecto string
param tagambiente string
param appServicePlanNamePortalProductores string
param appServicePortalProductoresApi string
param appServicePortalProductores string
param appServicePortalProductoreskind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


// Para el despliegue de los recursos en el grupo de recursos RSGR-QA-ADMIN-001
module qa 'main-rsgr-qa-admin-001.bicep' = {
  name: 'deployToRSGR-QA-PTLPRODUCTORES'
  scope: resourceGroup('RSGR-QA-PTLPRODUCTORES')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNamePortalProductores: appServicePlanNamePortalProductores
        appServicePortalProductoresApi: appServicePortalProductoresApi
        appServicePortalProductores : appServicePortalProductores
        appServicePortalProductoreskind : appServicePortalProductoreskind
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider
  }
}
