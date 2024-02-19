#!/bin/bash

# Create security groups
openstack security group create web-access --description "Allow TCP 22, 80, 443 access"
openstack security group create database-access --description "Allow TCP access to database ports"

# Add rules to security groups
openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 web-access
openstack security group rule create --protocol tcp --dst-port 80:80 --remote-ip 0.0.0.0/0 web-access
openstack security group rule create --protocol tcp --dst-port 443:443 --remote-ip 0.0.0.0/0 web-access

openstack security group rule create --protocol tcp --dst-port 3306:3306 --remote-ip 0.0.0.0/0 database-access

echo "Security groups created successfully."
