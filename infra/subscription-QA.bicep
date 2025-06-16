targetScope = 'subscription'

param location string
param tagproyecto string
param tagambiente string
/*param appServicePlanNameCredenciales string
param appServiceCredenciales string
param appServiceCredencialeskind string*/
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


// Para el despliegue de los recursos en el grupo de recursos RSGR-QA-ADMIN-001
module qa 'main-rsgr-qa-credenciales-001.bicep' = {
  name: 'deployToRSGR-QA-VISUALIZADOR-001'
  scope: resourceGroup('RSGR-QA-VISUALIZADOR-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
       /* appServicePlanNameCredenciales : appServicePlanNameCredenciales
        appServiceCredenciales : appServiceCredenciales
        appServiceCredencialeskind : appServiceCredencialeskind*/
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider
  }
}
