

module "mod_sentinel_connector" {
  #source = "github.com/POps-Rox/tf-az-overlays-sentinel"
  #version = "x.x.x"
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  # Required Inputs
  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  # Only Required for Conent Hub Solutions
  enable_sentinel_onboarding                  = false
  log_analytics_workspace_name                = azurerm_log_analytics_workspace.sentinel_workspace.name
  log_analytics_workspace_resource_group_name = azurerm_log_analytics_workspace.sentinel_workspace.resource_group_name

  data_connectors = ["AzureActiveDirectory", "AzureAdvancedThreatProtection"]
}
