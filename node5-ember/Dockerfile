FROM markadams/chromium-xvfb

MAINTAINER Agustín Herranz <agustin@codecantor.com>

# Install run dependencies
RUN set -ex \
	&& runDeps=' \
  curl \
  git \
  openssh-client \
  ' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $runDeps

# Add nodejs repo
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN set -ex \
	&& buildDeps=' \
  nodejs \
  ' \
	&& apt-get update \
	&& apt-get install -y $buildDeps \
  # cleanup
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /cache/node_cache/
RUN mkdir -p /cache/bower_cache/
# Set npm/bower configs
ENV npm_config_spin false
ENV npm_config_cache /cache/node_cache/
ENV npm_config_progress false
ENV npm_config_cache-min 43200

ENV bower_storage__packages=/cache/bower_cache/
# Allow bower to run as root user
ENV bower_allow_root=true

RUN npm install bower --global
RUN npm install ember-cli --global

# add SSH private key
COPY utils/add_ssh_private_key.sh /usr/bin/add_ssh_private_key

# add watermark script -> show platform versions
COPY utils/watermark.sh /usr/bin/watermark

# WORKDIR /usr/src/app
ONBUILD WORKDIR $CI_PROJECT_DIR
