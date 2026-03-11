# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#######################################
# DEPLOY AZURE SENTINEL FUSION RULES ##
#######################################

resource "azurerm_sentinel_alert_rule_fusion" "sentinel_alert_rule_fusion" {
  depends_on                 = [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel]
  for_each                   = var.enable_sentinel && var.fusion_alert_rules != null ? var.fusion_alert_rules : tomap({})
  name                       = format("%s-%s-%s", element(split("/", local.workspace_id), 8), "SecurityInsights", uuid())
  log_analytics_workspace_id = local.workspace_id
  alert_rule_template_guid   = each.value.alert_rule_template_guid
  enabled                    = each.value.enabled
}
