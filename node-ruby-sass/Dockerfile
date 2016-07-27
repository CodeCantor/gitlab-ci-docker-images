# Node/ruby image for sass compile in Gitlab CI builds.
FROM debian:jessie

MAINTAINER Agustín Herranz <agustin@codecantor.com>

# Install run dependencies
RUN set -ex \
    && runDeps=' \
    curl \
    git \
    openssh-client \
    ca-certificates \
    ' \
    && apt-get update \
    && apt-get install -y --no-install-recommends $runDeps \
    # cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add nodejs repo
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt update \
    && apt-get install --yes nodejs \
    # cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Ruby
RUN set -ex \
    && buildDeps=' \
    ruby \
    ruby-dev \
    build-essential \
    patch \
    file \
    fontconfig \
    ' \
    && apt-get update \
    && apt-get install -y $buildDeps \
    # cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install ruby's bundler
RUN gem install bundler

RUN mkdir -p /cache/node_cache/
# Set npm/bower configs
ENV npm_config_spin false
ENV npm_config_cache /cache/node_cache/
ENV npm_config_progress false
ENV npm_config_color false
ENV npm_config_cache-min 43200
#ENV npm_config_bin-links false
ENV npm_config_optional false

ENV bower_storage__packages=/cache/bower_cache/
# Allow bower to run as root user
ENV bower_allow_root=true

RUN mkdir -p /cache/bower_cache/ \
    && npm install npm --global \
    && npm install bower --global \
    && npm install grunt-cli --global \
    && npm install gulp-cli --global \
    && npm install npm-run --global \
    && npm cache clean

# add SSH private key
COPY utils/add_ssh_private_key.sh /usr/bin/add_ssh_private_key

# add watermark script -> show platform versions
COPY utils/watermark.sh /usr/bin/watermark
