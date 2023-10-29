#!/bin/bash

# Function to build
#
# The `tar` command is used to create a `.caidx` index file from the original data.
#
# - [Casync Documentation](https://github.com/systemd/casync)
# - [Desync GitHub Repository](https://github.com/folbricht/desync)

build() {
  rm -rf $1.caidx
  chmod +x ./$DESYNC_COMMAND
  ./$DESYNC_COMMAND tar --store store -i $1.caidx $1/
}

# Detect the operating system
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    DESYNC_COMMAND='./thirdparty/desync_0.9.5_linux_amd64/desync'
    ;;
  'Darwin') 
    OS='Mac'
    DESYNC_COMMAND='./thirdparty/desync_0.9.5_darwin_amd64/desync'
    ;;
  'WindowsNT')
    OS='Windows'
    DESYNC_COMMAND='./thirdparty/desync_0.9.5_windows_amd64/desync'
    ;;
  *) ;;
esac

build "vsekai_game_windows_x86_64"
build "vsekai_game_linux_x86_64"
build "vsekai_game_macos_x86_64"
