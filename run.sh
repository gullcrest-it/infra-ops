#!/bin/bash
# cron wrapper: ./run.sh backup/nightly.sh
set -a; . "$(dirname "$0")/config/production.env"; set +a
exec "$(dirname "$0")/$1"
