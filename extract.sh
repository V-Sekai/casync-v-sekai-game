#!/bin/bash

# Function to extract and build
#
# The `untar` command is used to reconstruct the original data from the `.caidx` index file.
#
# - [Casync Documentation](https://github.com/systemd/casync)
# - [Desync GitHub Repository](https://github.com/folbricht/desync)

set -x 

extract_and_build() {
  rm -rf $1 $1.tar
  mkdir -p $1 ~/.local/casync-store
  chmod +x ./$DESYNC_COMMAND
  $DESYNC_COMMAND untar --no-same-owner --cache ~/.local/casync-store --store store --index $1.caidx $1/
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
  'MSYS_NT-10.0-22621')
    OS='Windows'
    DESYNC_COMMAND='./thirdparty/desync_0.9.5_windows_amd64/desync'
    ;;
  *) ;;
esac

extract_and_build "vsekai_game_windows_x86_64"
extract_and_build "vsekai_game_linux_x86_64"
extract_and_build "vsekai_game_macos_x86_64"
