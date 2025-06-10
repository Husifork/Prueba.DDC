targetScope = 'subscription'

//param environment string 
param appServicePlanNameAdministracion string
param appServiceAdministracion1 string
param location string

// RG 1: Para el primer RG donde se desplieguen App Services, Storages
module qa 'main-rsgr-qa-admin-001.bicep' = {
  name: 'deployToRSGR-QA-ADMIN-001'
  scope: resourceGroup('RSGR-QA-ADMIN-001')
  params: {
        location: location
        appServicePlanNameAdministracion: appServicePlanNameAdministracion
        appServiceAdministracion1: appServiceAdministracion1
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
