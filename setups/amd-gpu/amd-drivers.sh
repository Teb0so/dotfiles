#!/bin/bash
set -e

echo "Enabling i386 architecture..."
dpkg --add-architecture i386

echo "Updating package lists..."
apt update

echo "Installing AMD GPU drivers..."
apt install -y \
    firmware-amd-graphics \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers:i386 \
    libgl1-mesa-dri \
    libgl1-mesa-dri:i386 \
    xserver-xorg-video-amdgpu \
    vulkan-tools

echo
echo "AMD GPU driver installation complete."
echo
echo "Checking GPU:"
lspci -k | grep -EA3 'VGA|3D|Display'

echo
echo "Checking Vulkan:"
vulkaninfo --summary
