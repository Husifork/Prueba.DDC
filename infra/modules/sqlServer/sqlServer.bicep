param name string
param location string
param administratorLogin string
param administratorLoginPassword string
param version string = '12.0' // Default a la versión común de SQL
param tagproyecto string
param tagambiente string

resource sqlServer 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: name
  location: location
  tags: {
    Proyecto: tagproyecto
    Ambiente: tagambiente
  }
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    version: version
  }
}

output serverName string = sqlServer.name
output serverId string = sqlServer.id
