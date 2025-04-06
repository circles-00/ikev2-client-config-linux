!#/bin/env bash

DEFAULT_MTU=1350

# Take parameter from command line
status=$1
custom_mtu=$2
default_nic=$(ip route | grep default | awk '{print $5}')

if [ -z "$status" ]; then
    echo "Error: No status provided. Please provide 'up' or 'down'."
    exit 1
fi

if [ "$status" == "up" ]; then
  if [ -z "$custom_mtu" ]; then
    mtu=$DEFAULT_MTU
  fi

    echo "Starting connection..."
    ipsec up some-vpn
    echo "Setting MTU to $mtu for $default_nic"
    sudo ip link set dev $default_nic mtu $mtu
    echo "Connection started."
elif [ "$status" == "down" ]; then
    echo "Stopping connection..."
    ipsec down some-vpn
    echo "Setting MTU to 1500 for $default_nic"
    sudo ip link set dev $default_nic mtu 1500
    echo "Connection stopped."
else
    echo "Error: Invalid status. Please provide 'up' or 'down'."
    exit 1
fi
