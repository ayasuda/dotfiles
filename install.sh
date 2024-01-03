#!/bin/bash

install_path=$HOME
installer_path=`pwd`
depends=(brew git)
apps=(zsh vim tmux ghq peco gh)
dotfiles=(zshrc vimrc screenrc gitconfig tmux.conf)

check_dependency()
{
  local _target=$1
  if ! command -v $_target &> /dev/null
  then
    echo "'$_target' could not be found, please install before"
    exit
  else
    echo "ok, '$_target' already installed"
  fi
}

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

install_app()
{
  local _target=$1
  if ! command -v $_target &> /dev/null
  then
    brew install $_target
  else
    echo "skip install $_target"
  fi
}

echo "Check dependencies"
for cmd in ${depends[@]}
do
  check_dependency $cmd
done

echo "Prepare install"
cd ${installer_path}
git submodule init
git submodule update

echo "Install apps"
for app in ${apps[@]}
do
	install_app $app
done

echo "Install dotfiles"
for file in ${dotfiles[@]}
do
	install_file "${installer_path}/${file}" "${install_path}/.${file}"
done

echo "Install bin scripts"
create_dir $install_path/bin

for file in `ls $installer_path/bin`
do
  install_file "${installer_path}/bin/${file}" "${install_path}/bin/${file}"
done

echo "Install vim plugins"
create_dir $install_path/.vim/autoload
if [ ! -e "$install_path/.vim/autoload/plug.vim" ]; then
  echo "install plug.vim"
  curl -fLo $install_path/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "skip install plug.vim"
fi

# windows
#iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
#    ni $HOME/vimfiles/autoload/plug.vim -Force
