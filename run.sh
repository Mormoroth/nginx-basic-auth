#!/bin/sh
export PROXY_PASS=$PROXY_PASS
echo $PROXY_PASS | envsubst '$PROXY_PASS' < /etc/nginx/conf.d/default.conf.val > /etc/nginx/conf.d/default.conf
htpasswd -bBc /etc/nginx/.htpasswd $BASIC_AUTH_USERNAME $BASIC_AUTH_PASSWORD
nginx -g "daemon off;"
