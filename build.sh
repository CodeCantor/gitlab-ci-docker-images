#! /usr/bin/env bash

ORGANIZATION="codecantor"
PREFIX="gitlab-ci-builds"
TAG=latest

if [ -n "$1" ]
then
  IMAGES="$1"
else
  IMAGES="ruby2.3 node5-ember node-ruby-sass"
fi

for NAME in $IMAGES
do
# Copy utilities
if [ -d ./$NAME ]
then
  mkdir -p ./$NAME/utils/
  cp ./utils/* ./$NAME/utils/
fi

echo "Building Docker image: $ORGANIZATION/$PREFIX-$NAME:$TAG"

docker build --no-cache -t $ORGANIZATION/$PREFIX-$NAME:$TAG $NAME/
docker push $ORGANIZATION/$PREFIX-$NAME:$TAG

done
