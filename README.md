<div align="center">
<img src="https://dotfiles.github.io/images/dotfiles-logo.png" alt="logo">

![GitHub status](https://img.shields.io/badge/status-active-brightgreen)
![GitHub issues](https://img.shields.io/github/issues/tory1103/dotfiles?color=yellow)
![GitHub pull requests](https://img.shields.io/github/issues-pr/tory1103/dotfiles)
![GitHub license](https://img.shields.io/github/license/tory1103/dotfiles?color=blue)
![GitHub last commit](https://img.shields.io/github/last-commit/tory1103/dotfiles?color=red)
</div>

---

# Table of contents
- [Overview](#overview)
	- [What is a setup](#whats-setup)
	- [What is a config file](#whats-config)
- [Installation](#installation)
- [Importing your first setup](#import-first-setup)
	- [Neovim setup](#neovim-setup)
	- [Coc setup](#coc-setup)
	- [Zsh setup](#zsh-setup)
- [How setups works](#how-setups-works)
- [How to restore old config files](#restore-config)

---

# Overview <a name="overview"></a>
This project will help you setting up your favorite apps with setups and configs already created. It main script will automatically install all the setups you have select.

## What is a setup <a name="whats-setup"></a>
A setup is the process of installing an aplication dependencies and generating config files.

## What is a config file <a name="whats-config"></a>
A config file is a text file where an aplication configuration is stored.

# Installation <a name="installation"></a>
```bash
git clone https://github.com/tory1103/dotfiles.git # Clone github repository
cd dotfiles # Change directory

sudo chmod +x install.sh # Give execution perms

# To install setups run:
./install.sh <setup1> <setup2> ... <setupN>  # Install selected setups
# or
./install.sh all # Install all setups

# Show help menu
./install.sh help # Displays help menu
```
> NOTE: The script must be run with SUDO

# Importing your first setup <a name="import-first-setup"></a>
Imagine you want to import neovim config, you could make it manually copying ./config/nvim folder into ~/.config/ or using the installation script.

The script will install dependencies automatically and make needed changes to files.
```bash
./install.sh neovim # Installs neovim and imports config files
# or
./setups/nvim.sh # Installs neovim and imports config files
```
> NOTE: You must be in the parent folder (./dotfiles/)

In some cases setups could interfere each others, our recommendation is to install one by one the setups.

## Neovim setup details <a name="neovim-setup"></a>
Folders and files modified:
- ~/.config/nvim/

> When installed run :PlugInstall inside neovim to install plugins

## Coc setup details <a name="coc-setup"></a>
Folders and files modified:
- ~/.config/coc/

Coc extension list:
- coc-clangd
- coc-css
- coc-docker
- coc-go
- coc-java
- coc-json
- coc-pairs
- coc-phpls
- coc-python
- coc-snippets
- coc-tsserver

> When installed restart your terminal and run :CocUpdate inside neovim to update coc extensions

> NOTE: If clangd doesn't work, run :CocCommand clangd.install

## Zsh setup details <a name="zsh-setup"></a>
Folders and files modified:
- ~/.config/zsh/
- ~/.zshrc

> When installed restart your terminal

# How setups works <a name="how-setups-works"></a>
All the setups installs current aplication dependencies and creates restorations points for config folders and files. It also copies configs to it correct path.

# How to restore old config files <a name="restore-config"></a>
Restoration points are stored in the same folder as the config file. For example, neovim restoration point is stored in ~/.config/nvim.dotfiles/.

To restore this config remove current config folder (~/.config/nvim/) and move it restoration folder to the path.
```bash
rm -rf ~/.config/nvim/ # Remove current config foler
mv ~/.config/nvim.dotfiles/ ~/.config/nvim/ # Mover restoration point
```

---

