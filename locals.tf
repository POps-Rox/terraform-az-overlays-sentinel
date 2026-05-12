
locals {
  workspace_id = var.enable_sentinel_onboarding ? azurerm_sentinel_log_analytics_workspace_onboarding.sentinel[0].workspace_id : var.log_analytics_workspace_id
  # azurerm 4.x removed `workspace_name` and `resource_group_name` from
  # `azurerm_sentinel_log_analytics_workspace_onboarding`; derive them by
  # parsing the ARM resource ID:
  #   /subscriptions/{sub}/resourceGroups/{rg}/providers/Microsoft.OperationalInsights/workspaces/{name}
  _workspace_id_parts           = split("/", local.workspace_id)
  workspace_name                = var.enable_sentinel_onboarding ? local._workspace_id_parts[8] : var.log_analytics_workspace_name
  workspace_resource_group_name = var.enable_sentinel_onboarding ? local._workspace_id_parts[4] : var.log_analytics_workspace_resource_group_name
}
