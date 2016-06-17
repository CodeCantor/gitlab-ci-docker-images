# Ruby 2.3.0 image for Gitlab CI builds.
FROM ruby:2.3-slim

MAINTAINER Agustín Herranz <agustin@codecantor.com>

RUN set -ex \
	&& runDeps=' \
	libpq5 \
  imagemagick \
  curl \
  git \
  openssh-client \
  chromium \
  xvfb \
	file \
  gcc \
  make \
	g++ \
	libpq-dev \
	libffi-dev \
	xauth \
	qt5-default \
	libqt5webkit5-dev \
	gstreamer1.0-plugins-base \
	gstreamer1.0-tools \
	gstreamer1.0-x \
  ' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $runDeps \

  # cleanup
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# chromium launcher from markadams/chromium-xvfb Dockerfile
# https://github.com/mark-adams/docker-chromium-xvfb/blob/master/images/base/xvfb-chromium
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN set -ex \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /cache/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_BIN="$GEM_HOME/bin" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
	&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

RUN gem install capybara-webkit
ENV DISPLAY ":99"

# add SSH private key
COPY utils/add_ssh_private_key.sh /usr/bin/add_ssh_private_key

# add watermark script -> show platform versions
COPY utils/watermark.sh /usr/bin/watermark

ONBUILD WORKDIR $CI_PROJECT_DIR
