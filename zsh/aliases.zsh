# vim: set filetype=sh :
chromium_app_mode() {
	if [[ $# < 1 ]]; then
		chromium -app="https://www.duckduckgo.com"
		return
	fi
	chromium -app="https://$1" $@
}
alias q="exit"
alias c="clear"
alias su="su $@ -"
alias dir="ls -1"
alias inst="sudo emerge -av $@"
alias uins="sudo emerge -ac $@"
alias mplr="ncmpcpp"
alias kill="kill -s QUIT $@"
alias gidr="cd ~/git"
alias gicl="git clone"
alias giad="git add"
alias gico="git commit"
alias gipu="git push"
alias gist="git status"
alias termite="termite -e tmux"
alias chromium=chromium_app_mode $@

if [[ "$DISPLAY" ]]; then
	alias qute="qutebrowser --backend webengine"
fi

if [[ "$TMUX" ]]; then
	alias selp="tmux selectp -t"
	alias selw="tmux selectw -t"
	alias brkp="tmux breakp"
	alias kilw="tmux killw"
	alias kils="tmux kill-session"
	alias kilp="tmux killp"
	alias rens="tmux rename"
	alias renw="tmux renamew"
	alias splh="tmux splitw -h"
	alias splv="tmux splitw -v"
	alias sync="tmux setw synchronize-panes"
	alias newc="tmux neww \; splitw -h -l102 \; selectp -t1"
fi
