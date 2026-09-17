# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "sentinel_id" {
  value       = try(azurerm_sentinel_log_analytics_workspace_onboarding.sentinel[0].id, null)
  description = "The ID of the Security Insights Sentinel Onboarding States."
}
output "iot_id" {
  value       = try(azurerm_sentinel_data_connector_iot.data_connector_iot[0].id, null)
  description = "The ID of the Iot Data Connector."
}
output "security_center_id" {
  value       = try(azurerm_sentinel_data_connector_azure_security_center.data_connector_azure_security_center[0].id, null)
  description = "The ID of the Azure Security Center Data Connector."
}
output "dtc_ad_id" {
  value       = try(azurerm_sentinel_data_connector_azure_active_directory.data_connector_azure_active_directory[0].id, null)
  description = " The ID of the Azure Active Directory Data Connector."
}
output "dtc_threat_protection_id" {
  value       = try(azurerm_sentinel_data_connector_azure_advanced_threat_protection.data_connector_azure_advanced_threat_protection[0].id, null)
  description = "The ID of the Azure Advanced Threat Protection Data Connector."
}
output "dtc_ms_cloud_app_security_id" {
  value       = try(azurerm_sentinel_data_connector_microsoft_cloud_app_security.data_connector_microsoft_cloud_app_security[0].id, null)
  description = "The ID of the Microsoft Cloud App Security Data Connector."
}

output "scheduled_alert_rule_ids" {
  value       = { for key, rule in azurerm_sentinel_alert_rule_scheduled.rule : key => rule.id }
  description = "The IDs of the Sentinel scheduled alert rules."
}

output "machine_learning_behavior_analytics_alert_rule_ids" {
  value       = { for key, rule in azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.sentinel_alert_rule_machine_learning_behavior_analytics : key => rule.id }
  description = "The IDs of the Sentinel machine learning behavior analytics alert rules."
}

output "ms_security_incident_alert_rule_ids" {
  value       = { for key, rule in azurerm_sentinel_alert_rule_ms_security_incident.sentinel_alert_rule_ms_security_incident : key => rule.id }
  description = "The IDs of the Sentinel Microsoft security incident alert rules."
}
