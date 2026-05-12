# v2.0.0 - 2026-05-11

Changed
- **BREAKING**: Upgrade `azurerm` provider to `~> 4.20` (was `~> 3.116`).
- **BREAKING**: Upgrade `azapi` provider to `~> 2.0` (was `~> 1.11.0`).
- **BREAKING**: Raise minimum Terraform CLI to `>= 1.10` (was `>= 1.9`).
- Examples: pin matching provider versions; add `subscription_id` env-var hint
  (azurerm 4.x requires `ARM_SUBSCRIPTION_ID` for apply; `validate` unaffected).
- Removed deprecated `skip_provider_registration` from all 18 example provider blocks
  (removed in azurerm 4.x — replaced by `resource_provider_registrations` if opted in).

Removed
- `retention_policy {}` block inside `azurerm_monitor_aad_diagnostic_setting.aad_logs`
  `enabled_log` dynamic block (`resources.sentinel.aad.settings.tf`). The
  `retention_policy` argument was removed from diagnostic settings in azurerm 4.x;
  retention is now managed on the destination Log Analytics workspace via that
  resource's `retention_in_days` attribute. Audit notes:
  - The 2 remaining `retention_policy_days` hits in
    `examples/{Government,Commerical}/add_aad_monitor_settings/variables.tf` are
    Terraform **variable names**, not azurerm attributes — they remain unchanged.

Notes
- Cross-module dependency: transitive sibling overlays must also ship 4.x-compatible
  releases before this version can resolve cleanly via `terraform init -upgrade`.

# v1.0.0 - <date>

Added
- Add Something you added
