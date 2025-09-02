#!/bin/bash
# deploy portal build + post the maintenance notice
set -e
HOST=portal.gullcrest.com
rsync -az --delete build/ "ops@$HOST:/var/www/portal/"
curl -s -c /tmp/portal.jar -d "username=$PORTAL_ADMIN_USER" -d "password=$PORTAL_ADMIN_PASS" \
  "https://$HOST/login" >/dev/null
curl -s -b /tmp/portal.jar -d "text=Portal updated $(date +%F)" "https://$HOST/admin/notice" >/dev/null
rm -f /tmp/portal.jar
