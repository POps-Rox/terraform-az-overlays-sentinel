
locals {
  workspace_id                  = var.enable_sentinel_onboarding ? azurerm_sentinel_log_analytics_workspace_onboarding.sentinel[0].workspace_id : var.log_analytics_workspace_id
  workspace_name                = var.enable_sentinel_onboarding ? azurerm_sentinel_log_analytics_workspace_onboarding.sentinel[0].workspace_name : var.log_analytics_workspace_name
  workspace_resource_group_name = var.enable_sentinel_onboarding ? azurerm_sentinel_log_analytics_workspace_onboarding.sentinel[0].resource_group_name : var.log_analytics_workspace_resource_group_name
}
