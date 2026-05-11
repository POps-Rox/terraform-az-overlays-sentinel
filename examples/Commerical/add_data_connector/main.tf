

module "mod_sentinel_connector" {
  #source = "github.com/POps-Rox/terraform-az-overlays-sentinel"  
  #version = "x.x.x"  
  source     = "../../.."
  depends_on = [azurerm_log_analytics_workspace.sentinel_workspace, azurerm_log_analytics_solution.solutions]

  log_analytics_workspace_id = azurerm_log_analytics_workspace.sentinel_workspace.id
  deploy_environment         = "dev"

  data_connectors = ["AzureActiveDirectory", "AzureAdvancedThreatProtection"]
}
