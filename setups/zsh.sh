#!/bin/bash

install()
{
	# Superuser check
	[[ $(id -u) -ne 0 ]] && command -v sudo > /dev/null && sudo -v

	# Installing neovim package
	echo "[I] Installing zsh..."
	sudo apt update
	sudo apt install zsh git curl -y

	# Installing oh-my-zsh
	echo "[I] Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

	# Installing p10k
	echo "[I] Installing powerlevel10k for oh-my-zsh..."
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

	# Installing zsh plugins
	echo "[I] Installing oh-my-zsh plugins..."
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	# Installing fzf
	echo "[I] Installing fzf for oh-my-zsh..."
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	bash ~/.fzf/install
}

setup()
{
	# Moving old zsh config
	[[ -d ~/.config/zsh/ ]] && echo "[S] Creating restoration point for ~/.config/zsh/..." && mv ~/.config/zsh/ ~/.config/zsh.dotfiles/
	[[ -f ~/.zshrc ]] && echo "[S] Creating restoration point for ~/.zshrc..." && mv ~/.zshrc ~/.zshrc.dotfiles

	# Copying zsh config
	echo "[S] Importing config folder..."
	cp -r ./config/zsh/zsh/ ~/.config/zsh/
	cp ./config/zsh/zshrc ~/.zshrc

	# Changing default shell
	echo "[S] Changing default shell to zsh..."
	chsh -s $(which zsh) $(whoami)

	# Finish setup
	echo "[F] Restart your terminal to finish setup"
}

main()
{
	set -e
	install
	setup
}

main
