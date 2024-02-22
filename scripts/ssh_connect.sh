#!/bin/bash

FLOATING_IP=$(openstack floating ip list --format json | jq -r '.[0]."Floating IP Address"')
ssh -i deployment-key.pem debian@$FLOATING_IP
