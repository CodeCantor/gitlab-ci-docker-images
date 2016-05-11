#! /usr/bin/env bash

ORGANIZATION="codecantor"
PREFIX="gitlab-ci-builds"
TAG=latest

for NAME in "node5-ember"
do
# Copy utilities
mkdir -p ./$NAME/utils/
cp ./utils/* ./$NAME/utils/

docker build --no-cache -t $ORGANIZATION/$PREFIX-$NAME:$TAG $NAME/
docker push $ORGANIZATION/$PREFIX-$NAME:$TAG

done
