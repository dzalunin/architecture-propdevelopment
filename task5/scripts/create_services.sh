#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f "../manifests/namespaces/";

for ns in $(find "../manifests/services" -maxdepth 1 -mindepth 1 -type d ); do
    kubectl apply -f $ns;
done;

kubectl apply -f "../manifests/network/non-admin-api-allow.yml";