#! /usr/bin/env bash

ORGANIZATION="codecantor"
PREFIX="gitlab-ci-builds"
TAG=latest

IMAGES="ruby2.3 node5-ember"

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
