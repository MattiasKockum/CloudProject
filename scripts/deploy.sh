#!/bin/bash

# Frontend
FLOATING_IP=$(openstack floating ip list --format json | jq -r '.[0]."Floating IP Address"')
scp -i deployment-key.pem -r frontend_volume debian@$FLOATING_IP:/home/debian
ssh -i deployment-key.pem debian@$FLOATING_IP 'cd frontend_volume && docker compose up -d'
ssh -i deployment-key.pem debian@$FLOATING_IP 'docker ps'
