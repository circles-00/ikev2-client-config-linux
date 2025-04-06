# IKEV2 VPN configuration using StrongSwan

## Requirements
- A server with a public IP address (e.g., AWS EC2, DigitalOcean, etc.)
- StrongSwan installed on the client device (if applicable)

## Configuring the client
1. Make sure you have StrongSwan installed on your device.
2. Make sure if your server needs a ca certificate, you place it under `/etc/ipsec.d/cacerts/`
3. Make sure if your server needs a private key, you place it under `/etc/ipsec.d/private/`
4. Change the ipsec.conf and ipsec.sercet files to match your server configuration.
5. Run configure.sh script to generate the configuration files.

## Starting the VPN Connection
1. Run the start script to start the VPN connection: `connection.sh up`
2. Check the status of the connection: `ipsec statusall`
3. To stop the VPN connection, run the stop script: `connection.sh down`

## Known Setbacks
- Often when using the VPN connection over IKEV2, if you have higher MTU on your network interface
some sites will not open, so that's why we lower the MTU to 1350 by default when starting the VPN connection.
- If you need to configure the MTU to another value you can do so by passing an additional parameter to the `connection.sh` script.
- Example: `connection.sh up 1400`

