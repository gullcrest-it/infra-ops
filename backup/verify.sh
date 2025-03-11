#!/bin/bash
BUCKET=gullcrest-client-backups
for c in $(aws s3 ls "s3://$BUCKET/" | awk '{print $2}'); do
  echo "== $c"
  aws s3 ls "s3://$BUCKET/$c" --recursive | awk -v d="$(date -d '-7 days' +%F)" '$1 >= d' | tail -5
done
