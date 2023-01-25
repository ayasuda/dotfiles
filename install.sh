#!/bin/bash

install_path=$HOME
installer_path=`pwd`
dotfiles=(zshrc vimrc screenrc gitconfig tmux.conf)
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

if [ ! -d $install_path/bin ]; then
  echo "creating ${install_path}/bin"
  mkdir -p $install_path/bin
fi
for file in `ls $installer_path/bin`
do
  install_file "${installer_path}/bin/${file}" "${install_path}/bin/${file}"
done

if [ ! -d $install_path/.vim/autoload ]; then
  mkdir -p $install_path/.vim/autoload
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# windows
#iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
#    ni $HOME/vimfiles/autoload/plug.vim -Force
