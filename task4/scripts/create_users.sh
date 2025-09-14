#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f "../manifests/namespaces/";

for ns in $(find "../manifests/users" -maxdepth 1 -mindepth 1 -type d ); do
    kubectl apply -f $ns;
done;