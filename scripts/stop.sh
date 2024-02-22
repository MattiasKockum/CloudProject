#!/bin/bash

openstack stack delete project-stack

FLOATING_IP=$(openstack floating ip list --format json | jq -r '.[0]."Floating IP Address"')
file="/home/mattias/.ssh/known_hosts"
grep -v "$FLOATING_IP" "$file" > "$file.tmp"
mv "$file.tmp" "$file"
