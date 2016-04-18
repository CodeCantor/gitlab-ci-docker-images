#! /usr/bin/env bash

for command in  'chromium' \
'ruby' 'gem' 'bundle' \
'python' 'pip' \
'node' 'npm' 'bower' 'ember'
do
{
  which $command > /dev/null && echo "$command: $($command --version)"
}
done

exit 0 # Allways exit succesfully
