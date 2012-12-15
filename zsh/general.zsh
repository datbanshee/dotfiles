autoload -U compinit promptinit
compinit
promptinit

# this is for pacman 
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

# correcting all input
setopt CORRECT_ALL

# if there is an error in input suggest correction
SPROMPT="Error! input %r? ([Y]es/[N]o/[E]dit/[A]bort) "

# you don't need to use cd
# just input the path nad you'll get there
setopt autocd

# if forst letters are matching show menu of selection
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ================================
#                             Brew
# ================================
fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

# ================================
#                          History
# ================================
# where to save history
export HISTFILE=~/.zsh_history
# max number of command we will save in current session
export HISTSIZE=100
export SAVEHIST=$HISTSIZE
# turn on history
setopt APPEND_HISTORY
# delete all trash (empty strings, repeated commands etc.)
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# ================================
#                         ARCHIVES
# ================================
# Extracting archives
# example: extract file
extract () {
	if [ -f $1 ] ; then
	case $1 in
		*.tar.bz2)   tar xjf $1        ;;
		*.tar.gz)    tar xzf $1     ;;
		*.bz2)       bunzip2 $1       ;;
		*.rar)       unrar x $1     ;;
		*.gz)        gunzip $1     ;;
		*.tar)       tar xf $1        ;;
		*.tbz2)      tar xjf $1      ;;
		*.tbz)       tar -xjvf $1    ;;
		*.tgz)       tar xzf $1       ;;
		*.zip)       unzip $1     ;;
		*.Z)         uncompress $1  ;;
		*.7z)        7z x $1    ;;
		*)           echo "I don't know how to extract '$1'..." ;;
 	esac
 	else
		echo "'$1' is not a valid file"
	fi
}
# Pack archieve
# example: pk tar file
pk () {
	if [ $1 ] ; then
		case $1 in
		tbz)       tar cjvf $2.tar.bz2 $2      ;;
		tgz)       tar czvf $2.tar.gz  $2       ;;
		tar)      tar cpvf $2.tar  $2       ;;
		bz2)    bzip $2 ;;
		gz)        gzip -c -9 -n $2 > $2.gz ;;
		zip)       zip -r $2.zip $2   ;;
		7z)        7z a $2.7z $2    ;;
		*)         echo "'$1' cannot be packed via pk()" ;;
	esac
	else
		echo "'$1' is not a valid file"
	fi
}
