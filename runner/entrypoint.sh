#!/bin/sh
set -e

echo "Cloning locust repo..."

git clone \
  -b "$LOCUST_REPO_BRANCH" \
  https://${GIT_TOKEN}@github.com/FIVEJACK/itemku-locust.git \
  /tmp/tests

cd /tmp/tests

echo "Starting Locust UI..."

locust \
  -f "$LOCUSTFILE_PATH" \
  --host "$TARGET_HOST" \
  --web-host 0.0.0.0 \
  --web-port 8089