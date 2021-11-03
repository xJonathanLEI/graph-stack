#!/bin/sh

cp /etc/nginx/template.conf /etc/nginx/conf.d/default.conf

until getent hosts graph-node; do sleep 1; done

sed -i "s/__GRAPH_GRAPHQL_HOST__/${GRAPH_GRAPHQL_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__GRAPH_SUBSCRIPTION_HOST__/${GRAPH_SUBSCRIPTION_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__GRAPH_JSONRPC_HOST__/${GRAPH_JSONRPC_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__GRAPH_INDEXNODE_HOST__/${GRAPH_INDEXNODE_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__GRAPH_METRICS_HOST__/${GRAPH_METRICS_HOST}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__GRAPH_TOKEN__/${GRAPH_TOKEN}/g" /etc/nginx/conf.d/default.conf

exec /docker-entrypoint.sh nginx -g "daemon off;"
