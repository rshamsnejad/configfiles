#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### TMUX AUTOMATIC LAUNCH ###
if [ -z "$TMUX" ] ; then

	TERMINAL_EMULATOR="$(basename $(tty))"
	TERMINAL_EMULATOR=${TERMINAL_EMULATOR^^} # Uppercase all letters

	TERMINAL_PROCESS="$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))"

	if [ -x "$TERMINAL_PROCESS" ] ; then
		TERMINAL_EMULATOR=$(basename "$TERMINAL_PROCESS")
		TERMINAL_EMULATOR=${TERMINAL_EMULATOR^} # Uppercase first letter
	fi

	for i in $(seq -w 1 100) ; do
		if [ "$i" -eq 001 ] ; then
			SESSION_NAME="$TERMINAL_EMULATOR"
		else
			SESSION_NAME="$TERMINAL_EMULATOR-$i"
		fi

		if (exec tmux new -s "$SESSION_NAME") ; then
			break
		fi
	done
fi
###############


if [ -f ~/.bash_aliases ] ; then
	source ~/.bash_aliases
fi

export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;12m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] : \[$(tput sgr0)\]\[\033[38;5;159m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\][\t]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] {\$?} \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]\\$ \[$(tput sgr0)\]"
