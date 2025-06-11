param staticWebAppName string
param location string
@allowed([
  'Free'
  'Standard'
  'StandardLinux'
  'Basic'
])
param skuName string
@description('Etiqueta personalizada, ejemplo: administrador-front-qa')
param tag string
param repositoryUrl string
param branch string
@allowed([
  'GitHub'
  'AzureDevOpsGit'
  'GitLab'
  'Bitbucket'
])
param provider string


resource staticWebApp 'Microsoft.Web/staticSites@2024-04-01' = {
  name: staticWebAppName
  location: location
  tags: {
    ddc: tag
  }
  sku: {
    name: skuName
    tier: skuName
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: provider
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

resource staticWebAppBasicAuth 'Microsoft.Web/staticSites/basicAuth@2024-04-01' = {
  parent: staticWebApp
  name: 'default'
  location: location
  properties: {
    applicableEnvironmentsMode: 'SpecifiedEnvironments'
  }
}
