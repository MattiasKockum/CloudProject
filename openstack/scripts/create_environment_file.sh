#!/bin/bash

# Define the environment file path
ENV_FILE="environments/environment.yaml"

# Define variables for image, security groups, and keypair
IMAGE="debian10-docker"
SECURITY_GROUP_WEB="web-access"
SECURITY_GROUP_DB="database-access"
KEYPAIR="deployment-key"

# Write the environment file
cat << EOF > $ENV_FILE
parameters:
  ImageName: $IMAGE
  SecurityGroupWeb: $SECURITY_GROUP_WEB
  SecurityGroupDB: $SECURITY_GROUP_DB
  KeyPairName: $KEYPAIR
EOF

echo "Environment file created successfully."
