#!/bin/bash

install_path=$HOME
installer_path=`pwd`
dotfiles=(zshrc vim vimrc screenrc gitconfig tmux.conf)
cd ${installer_path}
git submodule init
git submodule update

install_file()
{
	local _target=$1
	local _linkname=$2
	if [ ! -e "${_linkname}" ]; then
		ln -s "${_target}" "${_linkname}"
		echo "linking ${_linkname}"
	else
		echo "skipping ${_linkname}"
	fi
}


for file in ${dotfiles[@]}
do
	install_file "${installer_path}/${file}" "${install_path}/.${file}"
done
