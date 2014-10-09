#!/bin/sh
cd ~
mkdir .af_vim_config
cd .af_vim_config
git clone https://github.com/florinsky/af-vim.git .
chmod +x configure.sh
./configure.sh
cd ~




