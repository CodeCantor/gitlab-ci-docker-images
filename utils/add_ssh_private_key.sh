#! /usr/bin/env bash

# export environment variables, must be called with source to work.

if [ -n "$SSH_PRIVATE_KEY" ]; then
  which ssh-agent > /dev/null || ( apt-get update -y && apt-get install openssh-client -y  )
  eval $(ssh-agent -s)
  ssh-add <(echo "$SSH_PRIVATE_KEY")
  mkdir -p ~/.ssh
  [[ -f /.dockerinit  ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

  echo "-> SSH_PRIVATE_KEY added successfully."
else
  echo "-> Couldn't read SSH_PRIVATE_KEY environment variable."
fi
