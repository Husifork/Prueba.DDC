#!/bin/bash
az deployment group validate \
  --resource-group my-resource-group \
  --template-file ../infra/main.bicep \
  --parameters ../infra/parameters/dev.parameters.json