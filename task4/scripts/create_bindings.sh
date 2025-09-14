#!/usr/bin/env bash
set -euo pipefail

for ns in $(find "../manifests/bindings" -maxdepth 1 -mindepth 1 -type d ); do
    kubectl apply -f $ns;
done;