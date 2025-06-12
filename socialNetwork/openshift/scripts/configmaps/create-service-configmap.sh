#!/bin/bash
set -x

cd $(dirname $0)/../..

# This script creates an OpenShift ConfigMap for all the services
# built upon the C++ jaeger client, which uses the jaeger-config.yml
# to find the jaeger end-point URL.
oc create cm service-config-json --from-file=config/service-config.json -n social-network

# Since the nginx-thrift service is not built upon the C++ jaeger client,
# this service requires the jaeger-config.json in a different format than
# the one in the ConfigMap jaeger-config. Then, we create a new ConfigMap.
# oc create cm nginx-thrift-jaeger --from-file=nginx-thrift-config/jaeger-config.json -n social-network

