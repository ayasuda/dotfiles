#!/usr/bin/env bash

#dotfiles installer

install_path=$HOME
installer_path=`pwd`

echo <<DESCRIPTION
installing those files
	.vimrc
	.vim (directory)
	.screenrc
	.zshrc
DESCRIPTION

install_file()
{
	local _target=$1
	local _linkname=$2
	if [ ! -e "${_linkname}" ]; then
		ln -s "${_target}" "${_linkname}"
	fi
}

install_file "${installer_path}/.vimrc" "${install_path}/.vimrc"
install_file "${installer_path}/.vim" "${install_path}/.vim"
install_file "${installer_path}/.screenrc" "${install_path}/.screenrc"
install_file "${installer_path}/.zshrc" "${install_path}/.zshrc"

cat <<NEXT
cd ${installer_path}
git submodule init
git sbumodlue update
NEXT
