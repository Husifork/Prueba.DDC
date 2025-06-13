targetScope = 'subscription'

param location string
param tagproyecto string
param tagambiente string
param appServicePlanNameGestorDocumental string
param appServiceGestorDocumental string
param appServiceGestorDocumentalkind string
param staticwebAppQAName string
param staticwebAppQAsku string
param staticwebAppQArepo string
param staticwebAppQAbranch string
param staticwebAppQAprovider string
/*param sqlServerName string
param sqlAdministratorLogin string
param sqlAdministratorPassword string
param sqlDatabaseName string
param sqlDatabaseSku string */


// Para el despliegue de los recursos en el grupo de recursos RSGR-QA-ADMIN-001
module qa 'main-rsgr-qa-admin-001.bicep' = {
  name: 'deployToRSGR-QA-ADMIN-001'
  scope: resourceGroup('RSGR-QA-GESTORCARGA-001')
  params: {
        location: location
        tagproyecto: tagproyecto
        tagambiente: tagambiente
        appServicePlanNameGestorDocumental: appServicePlanNameGestorDocumental
        appServiceGestorDocumental: appServiceGestorDocumental
        appServiceGestorDocumentalkind : appServiceGestorDocumentalkind
        staticwebAppQAName : staticwebAppQAName
        staticwebAppQAsku : staticwebAppQAsku
        staticwebAppQArepo : staticwebAppQArepo
        staticwebAppQAbranch : staticwebAppQAbranch
        staticwebAppQAprovider : staticwebAppQAprovider
 /*       sqlServerName: sqlServerName
        sqlAdministratorLogin: sqlAdministratorLogin
        sqlAdministratorPassword: sqlAdministratorPassword
        sqlDatabaseName: sqlDatabaseName
        sqlDatabaseSku: sqlDatabaseSku */
  }
}
