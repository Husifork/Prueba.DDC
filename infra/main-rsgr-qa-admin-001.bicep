targetScope = 'resourceGroup'

param location string = resourceGroup().location
param tagproyecto string
param tagambiente string
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string

module appServicePlan 'modules/appServicePlan/appServicePlanAdministrador.bicep' = {
  name: 'deployAppServicePlan'
  params: {
    location: location
    appServicePlanName: appServicePlanNameAdministracion
    tagproyecto: tagproyecto
    tagambiente: tagambiente
  }
}

 module appService1 'modules/appService/appService.bicep' = {
  name: 'deployAppService1'
  params: {
    location: location
    appServiceName: appServiceAdministracion1
    appServicePlanName: appServicePlanNameAdministracion
    tagproyecto: tagproyecto
    tagambiente: tagambiente

      }
  dependsOn: [
    appServicePlan
  ]

}

module staticWebAppQA 'modules/staticWebApp/staticWebApp.bicep' = {
  name: 'staticWebAppQA'
  params: {
    staticWebAppName: staticwebAppQAName
    location: location
    skuName: staticwebAppQAsku
    tagproyecto: tagproyecto
    tagambiente: tagambiente
    repositoryUrl: staticwebAppQArepo
    branch: staticwebAppQAbranch
    provider: staticwebAppQAprovider
  }
}
