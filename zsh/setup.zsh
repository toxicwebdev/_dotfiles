ZSH=$ZDOTDIR/.oh-my-zsh

if [ "$TERM" != "linux" ]; then
	if [ "$TERM" = "xterm-color" ]; then
		ZSH_THEME="junkfood"
	else
		ZSH_THEME="gnzh"
	fi
else
	ZSH_THEME="juanghurtado"
fi

source $ZSH/oh-my-zsh.sh
clear
