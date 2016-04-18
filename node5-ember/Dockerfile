FROM markadams/chromium-xvfb

MAINTAINER Agustín Herranz <agustin@codecantor.com>

# Install run dependencies
RUN set -ex \
	&& runDeps=' \
  curl \
  git \
  ' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $runDeps \

# Add nodejs repo
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN set -ex \
	&& buildDeps=' \
  nodejs \
  ' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
  # cleanup
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add SSH private key
ADD utils/add_ssh_private_key.sh /usr/bin/add_ssh_private_key

# add watermark script -> show platform versions
ADD utils/watermark.sh /usr/bin/watermark

# Set npm configs
RUN npm config set spin false --global
RUN npm config set cache /cache/node_cache/ --global
RUN npm config set progress false --global
RUN npm config set cache-min 86400 --global

ENV bower_storage__packages=/cache/bower_cache/

RUN npm install bower --global
RUN npm install ember-cli --global

# WORKDIR /usr/src/app
ONBUILD WORKDIR $CI_PROJECT_DIR
