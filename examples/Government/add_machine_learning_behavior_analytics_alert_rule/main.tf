# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_machine_learning_behavior_analytics_alert_rule" {
  #source = "azurenoops/overlays-sentinel/azurerm"
  #version = "x.x.x"
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_storage_account.sentinel_storage_account, azurerm_log_analytics_solution.solutions]

  # Required Inputs
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Only Required for Conent Hub Solutions
  enable_sentinel_onboarding                  = false
  log_analytics_workspace_name                = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_resource_group_name = azurerm_log_analytics_workspace.sentinel_workspace.resource_group_name

  # Fusion Alert Rules
  machine_learning_alert_rules = {
    "machine_learning_alert_rule_1" = {
      alert_rule_template_guid = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
      enabled                  = true
    }
  }
}
