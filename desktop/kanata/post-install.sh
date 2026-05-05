#!/usr/bin/env bash

set -euo pipefail

# paru -S kanata

# sudo gpasswd -a "$USER" input
# echo 'KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"' \
#   | sudo tee /etc/udev/rules.d/99-uinput.rules
# echo uinput | sudo tee /etc/modules-load.d/uinput.conf
# sudo udevadm control --reload && sudo udevadm trigger

# systemctl --user link /usr/lib/systemd/system/kanata.service
# systemctl --user enable --now kanata

# fcitx5-configtool: Global Options -> Trigger Input Method -> remove Ctrl+Space, add F13
