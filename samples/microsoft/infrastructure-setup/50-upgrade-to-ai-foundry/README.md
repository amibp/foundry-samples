# Upgrade to AI Foundry from Azure OpenAI

## About upgrading to Foundry

```bicep
// look up existing resource

// patch it
```

```bash
az cognitiveservices management 
```

```python
```

## Rollback to Azure OpenAI

## Inspect whether a resoure was upgraded before

Following properties are available to inspect whether a resource has previously upgraded or downgraded kind:

The following read-only properties will be retrievable from your CognitiveServices/accounts/ resource to backtrace the moment of upgrade.

```bicep
{
  {
    // Read only properties if your resource was upgraded:
    dateCreated: "2023-10-19T05:09:35.5156624Z",
    dateUpgraded: "2025-08-05T05:09:35.5156624Z" //overriden at retry
    previouskind: "OpenAI" // not needed until we support more than 1 kind
  }
}
```

Not sure who upgraded your resource to Azure AI Foundry? You can inspect the activity log in Azure Portal:

1. Use Azure Activity Logs (under "Monitoring") to see if an upgrade operation was performed.
1. Filter by "Write" operations on the storage account.
1. Look for operations listed as `Microsoft.CognitiveServices/accounts/write`.


## Limitations