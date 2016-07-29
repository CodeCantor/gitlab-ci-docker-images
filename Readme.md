# Docker images for Gitlab CI

This repository contains the definition of docker images used at [Codecantor](codecantor.com) for testing in gitlab-ci.

To creates the images download this repo to your local machine and run `docker login` to connect
to the _codecantor_ docker hub account. Then run the `./build.sh` script to create all the images.

If you want to create only an image append the name of the image. For example
`./build.sh node-ruby-sass`
