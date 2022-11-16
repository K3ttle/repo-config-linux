#!/bin/bash

: <<'END'
END

########## VARIABLES

zsh_dir="/home/$USER/.config/zsh"
repo_url='https://github.com/K3ttle/repo-config-linux.git'
default_shell='/bin/zsh'

######### MAIN

echo 'Updating repositories'
sudo apt update

if [ ! -d $zsh_dir ]; then
    mkdir -p $zsh_dir
    echo "Directory created: ${zsh_dir}"
fi

git clone $repo_url $zsh_dir

if [ ! -f $default_shell ]; then
    echo 'Installing zsh'
    sudo apt install zsh -y >/dev/null
    echo "zsh installed"
fi

chsh -s $default_shell
echo "Shell set: ${default_shell}"
