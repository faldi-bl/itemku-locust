#!/bin/bash
set -e

: "${LOCUST_REPO_BRANCH:=master}"
: "${LOCUSTFILE_PATH:=locustfile.py}"

echo "Cloning locust scripts repo..."

git clone \
  -b "$LOCUST_REPO_BRANCH" \
  --single-branch \
  --depth 1 \
  https://${GITHUB_TOKEN}@github.com/faldi-bl/itemku-locust.git

cd itemku-locust
cd runner

pip install -r requirements.txt

cd ..

exec locust -f "$LOCUSTFILE_PATH" "$@"