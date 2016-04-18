

ORGANIZATION="codecantor"
PREFIX="gitlab-ci-builds"
NAME="node5-ember"
TAG=latest


cp ./utils/add_ssh_private_key.sh ./$NAME/add_ssh_private_key.sh
cp ./utils/watermark.sh ./$NAME/watermark.sh

docker build -t $ORGANIZATION/$PREFIX-$NAME:$TAG node5-ember/

docker push $ORGANIZATION/$PREFIX-$NAME:$TAG
