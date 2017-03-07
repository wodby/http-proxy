FROM wodby/nginx:1.10

RUN apk add --no-cache curl && \
    rm /etc/gotpl/default-vhost.conf.tpl

COPY proxy.conf.tpl /etc/gotpl/
COPY init.sh /docker-entrypoint-init.d/
