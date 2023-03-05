#!/bin/bash

install()
{
	# Superuser check
	[[ $(id -u) -ne 0 ]] && echo "[E] Must run this script as superuser..." && exit 1

	# Installing neovim package
	echo "[I] Installing neovim..."
	apt update
	apt install neovim curl git -y

	# Installing vimplug plugin manager
	echo "[I] Installing vimplug for neovim..."
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

setup()
{
	# Moving old neovim config
	[[ -d ~/.config/nvim/ ]] && echo "[S] Creating restoration point for ~/.config/nvim/..." && mv ~/.config/nvim/ ~/.config/nvim.dotfiles/

	# Copying neovim config
	echo "[S] Importing config folder..."
	cp -r ./config/nvim/ ~/.config/nvim/

	# Finish setup
	echo "[F] Run neovim :PlugInstall command to finish setup"
}

main()
{
	install
	setup
}

main
