#!/bin/bash
# nightly off-site backup, cron: 30 2 * * * /opt/infra-ops/run.sh backup/nightly.sh
set -e
BUCKET=gullcrest-client-backups
# s3 sync kept timing out over the public route; go through the gateway first
corvane-cli connect --gateway "$VPN_GATEWAY" --realm "$VPN_REALM" --user "$VPN_USER" --password "$VPN_PASS" --background || true
for d in /srv/backups/*/; do
  client=$(basename "$d")
  aws s3 sync "$d" "s3://$BUCKET/$client/" --storage-class STANDARD_IA --only-show-errors
done
echo "$(date -Is) backup ok" >> /var/log/infra-ops/backup.log
