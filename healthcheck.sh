#!/bin/bash
# healthcheck.sh - warn when root disk usage crosses a threshold
THRESHOLD=${1:-85}
usage=$(df / --output=pcent | tail -1 | tr -dc '0-9')
if [ "$usage" -ge "$THRESHOLD" ]; then
  logger -t healthcheck -p user.warning "Disk usage ${usage}% >= ${THRESHOLD}%"
  echo "WARN: disk ${usage}%"
  exit 1
fi
logger -t healthcheck "Disk usage OK (${usage}%)"
echo "OK: disk ${usage}%"
