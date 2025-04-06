#!/bin/env bash

echo "Configuring IPsec and StrongSwan..."
sudo cp -t /etc/ ipsec.conf ipsec.secrets

if [ -f /etc/ipsec.conf ]; then
  echo "Ipsec configuration successfully copied to /etc/"
else
  echo "Failed to copy ipsec configuration to /etc/"
  exit 1
fi

