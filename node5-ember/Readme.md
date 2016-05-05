# Docker image for Gitlab CI for Ember projects.

Based on: *markadams/chromium-xvfb*

Adds:
- curl
- git
- openssh-client
- node 5 (nodesource)
- npm 3
- ember-cli
- bower


## Specific Gitlab CI options

Set node cache to `/cache/node_cache/`

Set bower storage.packages to `/cache/bower_cache/`

Config npm cache settings and install animations: https://docs.npmjs.com/misc/config
Allow bower run as root user: https://github.com/bower/bower/issues/1752

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
