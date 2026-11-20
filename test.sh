#!/bin/bash
set -e
./healthcheck.sh 100 >/dev/null            # threshold 100: must pass
if ./healthcheck.sh 0 >/dev/null; then     # threshold 0: must warn
  echo "FAIL: expected a warning"; exit 1
fi
echo "All tests passed"
