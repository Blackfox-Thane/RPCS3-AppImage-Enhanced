#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm glew \
  glu \
  openal \
  qt6-base \
  qt6-declarative \
  qt6-multimedia \
  qt6-base \
  pugixml \
  llvm \
  opencv \
  ffmpeg \
  sdl3 \
  sndio \
  jack2 \
  vulkan-validation-layers

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package rpcs3-git

# If the application needs to be manually built that has to be done down here

# echo "Building RPCS3..."
# echo "---------------------------------------------------------------"
# git clone https://github.com/RPCS3/rpcs3.git
# cd rpcs3
# git submodule sync

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi

# mkdir ./build
# cd ./
# git submodule update --init --recursive
# cmake .. \
#   -Bbuild \
#   -G Ninja \
# cmake --build build

