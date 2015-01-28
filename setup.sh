#!/bin/bash

git submodule init
git submodule update --init --recursive
echo "Symlinking .vimrc and .vim file/directory"
CURRENT_DIR="${PWD}"
cd "${HOME}"

ln -s ${CURRENT_DIR}/.vimrc
ln -s ${CURRENT_DIR}/.vim
ln -s ${CURRENT_DIR}/.gitconfig

cd ${CURRENT_DIR}
echo "done"
