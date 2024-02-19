#!/bin/bash

# Define stack name
STACK_NAME="my-stack"

# Get the floating IP associated with VM1
FLOATING_IP=$(openstack floating ip list --format json | jq -r '.[0].Floating IP Address')

# Verify if the floating IP is associated with VM1
VM1_IP=$(openstack server list --format json | jq -r '.[] | select(.Name == "VM1") | .Networks' | cut -d "=" -f 2)
if [[ "$VM1_IP" == *"$FLOATING_IP"* ]]; then
    echo "Floating IP is correctly associated with VM1."
else
    echo "Error: Floating IP is not associated with VM1."
fi

# Verify the accessibility of the service
SERVICE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$FLOATING_IP)
if [ $SERVICE_STATUS -eq 200 ]; then
    echo "Service is accessible."
else
    echo "Error: Service is not accessible."
fi
