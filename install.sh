setup()
{
	# Creating config directory
	[[ ! -d ~/.config/ ]] && mkdir ~/.config/
}

install()
{
	for config in $@
	do
		case $config in
			nvim | neovim)
				bash ./setups/nvim.sh
				;;

			coc | coc-nvim | coc-neovim)
				bash ./setups/coc.sh
				;;

			zsh | omz | oh-my-zsh)
				bash ./setups/zsh.sh
				;;

			help | --help | h | -h)
				echo "Usage:
    ./install.sh <setup1> <setup2> ... <setupN>    Install selected setups
    ./install.sh all                               Install all setups

Setup list:"
for setup in $(ls ./setups/) ; do echo "    - " $(echo $setup | sed "s/\.sh//") ; done
				;;

			all | *)
				for setup in $(ls ./setups/) ; do bash ./setups/$setup ; done
				exit 0
				;;
		esac
	done
}

main()
{
	setup
	install $@
}

main $@
