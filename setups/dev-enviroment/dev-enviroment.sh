echo Installing packages...

sudo apt install -y \
    foot \
    zsh \
    zsh-syntax-highlighting \
    tmux \
    lazygit \
    ranger

echo Installing neovim dependencies...

sudo apt install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl

echo Cloning neovim...
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
echo Building neovim...
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
