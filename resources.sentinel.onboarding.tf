# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#####################################
# DEPLOY AZURE SENTINEL ONBOARDING ##
#####################################

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  count        = var.enable_sentinel && var.enable_sentinel_onboarding ? 1 : 0
  workspace_id = var.log_analytics_workspace_id
}