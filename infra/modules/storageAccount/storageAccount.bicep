param location string
param storageAccountName string
param tagproyecto string
param tagambiente string

resource sa 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  tags: {
    Proyecto: tagproyecto
    Ambiente: tagambiente
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}

output storageId string = sa.id
