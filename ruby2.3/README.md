# Docker image for Gitlab CI for Ruby projects

* Based on debian jessie
* Use part of the official ruby:2.3-slim Dockerfile

    - libpq5
    - imagemagick

Bundle install requirements:

- make
- gcc
- libpq5-dev
- libffi-dev
- g++


Paperclip:
 - file (util, package)
 - imagemagick

Capybara-webkit
- qt5-default
- libqt5webkit5-dev
- gstreamer1.0-plugins-base
- gstreamer1.0-tools
- gstreamer1.0-x

## Specific Gitlab CI options

Set GEM_HOME in `/cache/bundle`

\* The `/cache` is a predefined cached folder by gitlab-runner.

## Utils included

### Add SSH private key

Add a private ssh key and set ssh-agent. To use there have to be an environment variable
nemed $SSH_PRIVATE_KEY that stores the prvate key. The script must be called with
`source` or `.`.

```yml
  - source add_ssh_private_key
```

### Watermark

Show th current version of common used utilities and compiler.

```yml
  - watermark
```
