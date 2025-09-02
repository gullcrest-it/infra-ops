# infra-ops

Ops scripts for client backups and the staff portal. Run from the jump host as `ops`.

- `backup/nightly.sh` - sync /srv/backups to S3 (cron, 02:30)
- `backup/verify.sh` - list the last 7 days of uploads per client
- `deploy/portal.sh` - push the portal build and post a notice (needs PORTAL_ADMIN_*)
