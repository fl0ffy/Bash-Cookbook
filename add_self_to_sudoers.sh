#!/bin/bash
# run with sudo

echo "${SUDO_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${SUDO_USER}
