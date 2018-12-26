#!/bin/bash

echo "stack deploy.."
env $(cat .env.prod | grep '^[A-Z]' | xargs) RELEASE=${1:-latest} \
  docker stack deploy -c stack.yml currency_rate --with-registry-auth

echo "reload reverse proxy.."
reload_nginx

echo "success!"
