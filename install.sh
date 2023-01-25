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

create_dir()
{
  local _target=$1
  if [ ! -d "${_target}" ]; then
    echo "creating ${_target}"
    mkdir -p ${_target}
  else
    echo "already exists: ${_target}"
  fi
}


for file in ${dotfiles[@]}
do
	install_file "${installer_path}/${file}" "${install_path}/.${file}"
done

create_dir $install_path/bin

for file in `ls $installer_path/bin`
do
  install_file "${installer_path}/bin/${file}" "${install_path}/bin/${file}"
done

create_dir $install_path/.vim/autoload

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# windows
#iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
#    ni $HOME/vimfiles/autoload/plug.vim -Force
