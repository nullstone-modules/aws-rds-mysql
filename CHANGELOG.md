# 0.3.1 (Sep 21, 2026)
* Enabled `copy_tags_to_snapshot` so automated and final snapshots carry the workspace tags.

# 0.3.0 (Jul 02, 2026)
* Enabled CloudWatch log exports (error, general, slowquery) with a configurable `var.log_retention` (default 90 days).
* Granted the `log_reader` user read access to the new log groups, and added the `db_log_groups` output.
* Upgraded terraform providers.
* Switched to using `data.ns_workspace.aws_tags` which includes governance info.

# 0.2.0 (Jun 05, 2025)
* Added `var.maintenance_window` to control system updates are applied.
* Added `var.auto_upgrade_minor` to allow disabling of minor version upgrades.

# 0.1.5 (May 29, 2025)
* Added `db_hostname` and `db_port` outputs.

# 0.1.4 (Apr 17, 2025)
* Eliminated problematic special characters from password generation.

# 0.1.3 (Mar 29, 2025)
* Added support for storage auto-scaling.

# 0.1.2 (Aug 07, 2024)
* Upgraded db-admin to use `provided.al2023` lambda runtime as a result of go runtime deprecation.
* Upgraded CA Certificate for RDS instance.

# 0.1.1 (Feb 06, 2024)
* Added metrics support.

# 0.1.0 (Oct 24, 2023)
* Initial draft.
