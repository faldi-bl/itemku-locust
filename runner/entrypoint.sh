#!/bin/sh
set -e

echo "Cloning locust repo..."

git clone \
  -b "$LOCUST_REPO_BRANCH" \
  "$LOCUST_REPO_URL" \
  /tests

cd /tests

echo "Starting Locust UI..."

locust \
  -f "$LOCUSTFILE_PATH" \
  --host "$TARGET_HOST" \
  --web-host 0.0.0.0 \
  --web-port 8089