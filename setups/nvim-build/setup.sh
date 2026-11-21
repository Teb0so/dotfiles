echo Running setup: $0
shopt -s nocasematch

build_nvim() {
    echo Installing neovim dependencies...

    sudo apt install -y \
        ninja-build \
        gettext \
        cmake \
        unzip \
        curl

    echo Making build directory
    mkdir -p builds
    cd builds

    echo Cloning neovim...
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    echo Building neovim...
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
}

choice=n
echo "Build Neovim fom source [y/N]:"
read $choice
if [ "$choice" = y ]; then
    build_nvim
fi

echo Finished!
