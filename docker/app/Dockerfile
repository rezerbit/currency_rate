FROM ruby:2.5.3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    curl --silent --location https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -qq -y --no-install-recommends build-essential nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install --global yarn
RUN mkdir -p /app
WORKDIR /app
COPY . .
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
RUN bundle check || bundle install --binstubs="$BUNDLE_BIN"
