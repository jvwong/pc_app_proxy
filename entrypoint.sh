#!/bin/bash
set -e

sed -i "s|{{NGINX_HOST}}|$NGINX_HOST|;s|{{NGINX_PROXY}}|$NGINX_PROXY|;s|{{STATIC_ROOT}}|$STATIC_ROOT|" \
  /etc/nginx/conf.d/default.conf
cat /etc/nginx/conf.d/default.conf

# Execute whatever CMD has been passed. By default, the Nginx container defines a
# CMD instruction that starts nginx in the foreground, but we could define a different
# CMD at runtime that runs different commands or starts a shell if required.
exec "$@"
