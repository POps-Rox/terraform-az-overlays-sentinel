# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_aad_monitor_settings" {
  #source = "github.com/POps-Rox/terraform-az-overlays-sentinel"
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

  data_connector_aad_enabled = true
  data_connector_aad_logs    = var.data_connector_aad_logs
}
