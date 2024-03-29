#!/bin/bash

# Define stack name
STACK_NAME="project-stack"

# Launch the Heat stack
openstack stack create --template hot_template.yaml --environment environment.yaml $STACK_NAME

# Wait for stack creation to complete
echo "Waiting for stack creation to complete..."
while true; do
    STATUS=$(openstack stack show $STACK_NAME -f value -c stack_status)
    if [ "$STATUS" == "CREATE_FAILED" ]; then
        echo "Stack creation failed"
        openstack stack show $STACK_NAME
        openstack stack delete $STACK_NAME
    fi
    if [ "$STATUS" == "CREATE_COMPLETE" ]; then
        break
    fi
    if [ "$STATUS" == "DELETE_IN_PROGRESS" ]; then
        echo "Deleting..."
        #echo "Deleted"
        #exit 1
    fi
    sleep 5
done
echo "Stack creation completed successfully."

# Retrieve floating IP
FLOATING_IP=$(openstack floating ip list --format json | jq -r '.[0]."Floating IP Address"')

echo "VM1 web interface can be accessed at: http://$FLOATING_IP"
