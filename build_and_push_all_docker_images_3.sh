#!/usr/bin/env bash
set -euo pipefail
PROJECT_ROOT=$(pwd)

cd ${PROJECT_ROOT}/client
docker build -t federicoviscomi/client .
docker push federicoviscomi/client

cd ${PROJECT_ROOT}/comments/
docker build -t federicoviscomi/comments .
docker push federicoviscomi/comments

cd ${PROJECT_ROOT}/event-bus/
docker build -t federicoviscomi/event-bus .
docker push federicoviscomi/event-bus

cd ${PROJECT_ROOT}/moderation/
docker build -t federicoviscomi/moderation .
docker push federicoviscomi/moderation

cd ${PROJECT_ROOT}/posts/
docker build -t federicoviscomi/posts .
docker push federicoviscomi/posts

cd ${PROJECT_ROOT}/query/
docker build -t federicoviscomi/query .
docker push federicoviscomi/query
