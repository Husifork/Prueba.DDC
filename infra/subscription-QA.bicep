targetScope = 'subscription'

//param environment string 
param location string
param appServicePlanNameAdministracion string
param appServicePlanAdministraciontag object
param appServiceAdministracion1 string
param appServiceAdministracion1tag object
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQAtag string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string


// RG 1: Para el primer RG donde se desplieguen App Services, Storages
module qa 'main-rsgr-qa-admin-001.bicep' = {
  name: 'deployToRSGR-QA-ADMIN-001'
  scope: resourceGroup('RSGR-QA-ADMIN-001')
  params: {
        location: location
        appServicePlanNameAdministracion: appServicePlanNameAdministracion
        appServicePlanAdministraciontag : appServicePlanAdministraciontag 
        appServiceAdministracion1: appServiceAdministracion1
        appServiceAdministracion1tag : appServiceAdministracion1tag
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQAtag : staticwebAppQAtag
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider
  }
}

// RG 2: Para el segundo RG. Mockup
/*module pr 'main-rsgr-pr-admin-001.bicep' = {
  name: 'deployToRSGR-PR-ADMIN-001'
  scope: resourceGroup('RSGR-PR-ADMIN-001')
  params: {
    location: 'eastus2'
  }
}*/
