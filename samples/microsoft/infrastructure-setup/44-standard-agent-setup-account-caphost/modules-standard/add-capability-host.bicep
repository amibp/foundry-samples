param cosmosDBConnection string
param azureStorageConnection string
param aiSearchConnection string
param accountName string
param accountCapHost string
param projectName string

var threadConnections = ['${cosmosDBConnection}']
var storageConnections = ['${azureStorageConnection}']
var vectorStoreConnections = ['${aiSearchConnection}']

resource account 'Microsoft.CognitiveServices/accounts@2025-06-01' existing = {
   name: accountName
}

resource project 'Microsoft.CognitiveServices/accounts/projects@2025-06-01' existing = {
   parent: account
   name: projectName
}

resource accountCapabilityHost 'Microsoft.CognitiveServices/accounts/capabilityHosts@2025-06-01' = {
   name: accountCapHost
   parent: account
   properties: {
     capabilityHostKind: 'Agents'
     vectorStoreConnections: vectorStoreConnections
     storageConnections: storageConnections
     threadStorageConnections: threadConnections
   }
}

resource projectCapabilityHost 'Microsoft.CognitiveServices/accounts/projects/capabilityHosts@2025-06-01' = {
   name: 'projectcaphost'
   parent: project
   properties: {
     capabilityHostKind: 'Agents'
   }

   dependsOn: [
      accountCapabilityHost
   ]
}
