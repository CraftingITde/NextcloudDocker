#!/bin/sh
set -e

# Simple healthcheck for notify_push
if curl -f http://localhost:7867/healthcheck >/dev/null 2>&1; then
    # Service is healthy
    exit 0
else
    # Service is not healthy
    exit 1
fi