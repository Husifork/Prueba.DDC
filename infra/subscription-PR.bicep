targetScope = 'subscription'

//param environment string  
param location string
param tagproyecto string
param tagambiente string
param appServicePlanNameVisualizador string
param appServiceVisualizador string
param appServiceVisualizadorkind string
param staticwebAppPRName string
param staticwebAppPRsku string
param staticwebAppPRrepo string
param staticwebAppPRbranch string
param staticwebAppPRprovider string


module pr 'main-rsgr-pr-visualizador-001.bicep' = {
  name: 'deployToRSGR-PR-VISUALIZADOR-001'
  scope: resourceGroup('RSGR-PR-VISUALIZADOR-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameVisualizador : appServicePlanNameVisualizador
        appServiceVisualizador : appServiceVisualizador
        appServiceVisualizadorkind : appServiceVisualizadorkind
        staticwebAppPRName : staticwebAppPRName
        staticwebAppPRsku : staticwebAppPRsku
        staticwebAppPRrepo : staticwebAppPRrepo
        staticwebAppPRbranch  : staticwebAppPRbranch
        staticwebAppPRprovider : staticwebAppPRprovider

  }
}
