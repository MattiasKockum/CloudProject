#!/bin/bash

# Generate RSA keypair
openstack keypair create deployment-key > deployment-key.pem
chmod 600 deployment-key.pem

echo "RSA keypair created successfully."
