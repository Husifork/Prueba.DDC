targetScope = 'subscription'

param location string
param tagproyecto string
param tagambiente string
param appServicePlanNameVisualizador string
param appServiceVisualizador string
param appServiceVisualizadorkind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


// Para el despliegue de los recursos en el grupo de recursos RSGR-QA-ADMIN-001-
module qa 'main-rsgr-qa-visualizador-001.bicep' = {
  name: 'deployToRSGR-QA-VISUALIZADOR-001'
  scope: resourceGroup('RSGR-QA-VISUALIZADOR-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameVisualizador : appServicePlanNameVisualizador
        appServiceVisualizador : appServiceVisualizador
        appServiceVisualizadorkind : appServiceVisualizadorkind
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider
  }
}
