#!/bin/sh

set -e

echo "Don't forget to create a credentials file on /root/.smbcredentials"
echo "example:"
echo "username=YOUR_USERNAME"
echo "password=YOUR_PASSWORD"

sudo chmod 600 /root/.smbcredentials
sudo cp ./smb-mount.service /etc/systemd/system
sudo cp ./smb-mount.timer /etc/systemd/system

sudo systemctl daemon-reload
sudo systemctl enable smb-mount.service
sudo systemctl enable smb-mount.timer
sudo systemctl start smb-mount.timer
