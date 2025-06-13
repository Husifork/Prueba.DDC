param name string
param location string
param serverName string
param skuName string // Ej: 'Basic', 'Standard', 'Premium', 'S0', 'P1', etc
param collation string = 'SQL_Latin1_General_CP1_CI_AS'
param maxSizeBytes int = 2147483648 // 2 GB por defecto
param tagproyecto string
param tagambiente string

resource sqlDb 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  name: '${serverName}/${name}'
  location: location
  tags: {
    Proyecto: tagproyecto
    Ambiente: tagambiente
  }
  properties: {
    collation: collation
    maxSizeBytes: maxSizeBytes
  }
  sku: {
    name: skuName
  }
}

output databaseName string = sqlDb.name
output databaseId string = sqlDb.id
