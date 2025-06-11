targetScope = 'subscription'

param location string
param tagproyecto string
param tagambiente string
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


// Para el despliegue de los recursos en el grupo de recursos RSGR-QA-ADMIN-001
module qa 'main-rsgr-qa-admin-001.bicep' = {
  name: 'deployToRSGR-QA-ADMIN-001'
  scope: resourceGroup('RSGR-QA-GESTORCARGA-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameAdministracion: appServicePlanNameAdministracion
        appServiceAdministracion1: appServiceAdministracion1
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider

  }
}
