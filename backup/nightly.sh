#!/bin/bash
# nightly off-site backup, cron: 30 2 * * * /opt/infra-ops/backup/nightly.sh
set -e
BUCKET=gullcrest-client-backups
for d in /srv/backups/*/; do
  client=$(basename "$d")
  aws s3 sync "$d" "s3://$BUCKET/$client/" --storage-class STANDARD_IA --only-show-errors
done
echo "$(date -Is) backup ok" >> /var/log/infra-ops/backup.log
