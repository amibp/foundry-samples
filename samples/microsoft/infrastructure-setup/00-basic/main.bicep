param aiFoundryName string = 'uniquename'
param location string = 'westeurope'

/*
  An AI Foundry resources is a variant of a CognitiveServices/account resource type
*/ 
resource aiFoundry 'Microsoft.CognitiveServices/accounts@2025-06-01' = {
  name: aiFoundryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: 'S0'
  }
  kind: 'AIServices'
  properties: {
    // required to work in AI Foundry
    allowProjectManagement: true 

    publicNetworkAccess: 'Enabled'

    // was 'uniquename' before, could update to below
    customSubDomainName: ''

    disableLocalAuth: false
  }
}
