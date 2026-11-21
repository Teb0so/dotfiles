echo Running setup: $0
echo Installing Packages
set -e

script_path=$(pwd)/setups/amd-gpu-config

echo "Enabling i386 architecture..."
sudo dpkg --add-architecture i386

echo "Updating package lists..."
sudo apt update

echo "Installing AMD GPU drivers..."
sudo apt install -y \
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

echo Setting vsync configuration for xorg...

sudo cp $script_path/20-amdgpu.conf /etc/X11/xorg.conf.d/

echo Finished!
