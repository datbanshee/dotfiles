# =======
# COLOURS
# =======
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES=(
	'alias'			'fg=153,bold'
	'builtin'		'fg=153'
	'function'		'fg=166'
	'command'		'fg=153'
	'precommand'		'fg=153, underline'
	'hashed-commands'	'fg=153'
	'path'			'underline'
	'globbing'		'fg=166'
)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
source "`brew --prefix`/etc/grc.bashrc"
