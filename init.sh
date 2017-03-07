#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
  set -x
fi

gotpl /etc/gotpl/proxy.conf.tpl > /etc/nginx/conf.d/proxy.conf
