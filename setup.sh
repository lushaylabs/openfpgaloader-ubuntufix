#!/bin/env bash
USERNAME=$USER

echo "Giving User USB Permission for openFPGALoader"

wget https://raw.githubusercontent.com/trabucayre/openFPGALoader/master/99-openfpgaloader.rules -O /tmp/99-openfpgaloader.rules
sudo -s <<EOF
cp /tmp/99-openfpgaloader.rules /etc/udev/rules.d/
udevadm control --reload-rules && sudo udevadm trigger
usermod -a $USERNAME -G plugdev
EOF

echo "Done, Unplug and replug in the device now"
