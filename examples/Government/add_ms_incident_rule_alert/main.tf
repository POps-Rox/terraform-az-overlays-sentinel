# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "mod_sentinel_ms_security_incident_alert_rule" {
  #source = "github.com/POps-Rox/tf-az-overlays-sentinel"
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

  # MS Security Incident Alert Rules
  ms_security_incident_alert_rules = {
    "ms_security_incident_alert_rule_1" = {
      product_filter           = "Azure Security Center"
      display_name             = "Security Incident"
      severity_filter          = "High"
      alert_rule_template_guid = "f71aba3d-28fb-450b-b192-4e76a83015c8"
      description              = "Security Incident"
      enabled                  = true
    }
  }
}
