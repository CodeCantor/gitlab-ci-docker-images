

ORGANIZATION="codecantor"
PREFIX="gitlab-ci-builds"
NAME="node5-ember"
TAG=latest

# Copy utilities
cp ./utils/* ./$NAME/

docker build -t $ORGANIZATION/$PREFIX-$NAME:$TAG node5-ember/

docker push $ORGANIZATION/$PREFIX-$NAME:$TAG
