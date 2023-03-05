#!/bin/bash

install()
{
	# Superuser check
	[[ $(id -u) -ne 0 ]] && echo "[E] Must run this script as superuser..." && exit 1

	# Installing neovim package
	echo "[I] Installing coc for neovim..."
	apt update
	apt install neovim curl git -y

	# Installing npm and node
	echo "[I] Installing node version manager (NVM)..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

	# Load nvm
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

	# Install and use node verion v18.12.1
	nvm install v18.12.1
	nvm use v18.12.1
}

setup()
{
	# Moving old coc config
	[[ -d ~/.config/coc/ ]] && echo "[S] Creating restoration point for ~/.config/coc/..." && mv ~/.config/coc/ ~/.config/coc.dotfiles/

	# Copying coc config
	echo "[S] Importing config folder..."
	cp -r ./config/coc/ ~/.config/coc/

	# Finish setup
	echo "[F] Run neovim :CocUpdate command to finish setup"
}

main()
{
	install
	setup
}

main
