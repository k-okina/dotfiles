# Alias: エイリアス ========= {{{1

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias gf="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

alias ag="ag -S --stats"
alias agh="ag -S --stats --hidden"
alias pt="pt --global-gitignore"

alias %=" " # webにあるコマンドをコピペで実行出来るようにする

alias di="diff"
alias df="df -hl"
alias wget="noglob wget --no-check-certificate"
alias rake="noglob rake"
alias calc="noglob calc"

alias sudo="sudo -E " # sudoでもaliasが使えるようにする
# alias s="sudo"

# for ls
alias sl="ls"
alias l="ls -a"
alias ll="ls -l"
alias la="ls -la"
alias lrt="ls -lrt"

alias less="less --no-init --quit-if-one-screen -g -R"

# for vim
alias v="vim"
alias vi="vim"
alias gv="gvim"
alias pvim="vim -u NONE -i NONE -N"
alias pgvim="gvim -u NONE -i NONE -N"
alias vsh="vim -c VimShell"
alias lingr="vim -c LingrLaunch"
alias vihosts="sudo vim /etc/hosts"

# for emacs
alias e="emacsclient"

alias tgz="tar cvzf"
alias untar="tar xvf"

alias crontab="crontab -i"

# for dstat
alias dstat-full="dstat -Tclmdrn"
alias dstat-mem="dstat -Tclm"
alias dstat-cpu="dstat -Tclr"
alias dstat-net="dstat -Tclnd"
alias dstat-disk="dstat -Tcldr"

alias delete-empty-dir="find . -type d -empty -delete"

alias be="bundle exec"
alias vag="vagrant"
alias comp="composer"
alias c="composer"
alias a="php artisan"
alias oil="noglob oil"

alias d="docker"
alias dc="docker-compose"

for command in nautilus caja thunar nemo
do
	if exists $command; then
		alias open=$command
	fi
done

case "${OSTYPE}" in
linux*)
	alias tbz2="tar cvjf"
	;;
darwin*)
	alias tbz2="tar cvjf"
	# alias ql="qlmanage -p $@ >& /dev/null"

	if [ -f "/Applications/Emacs.app/Contents/MacOS/Emacs" ]; then
		alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
	fi

	if [ -f "/Applications/MacVim.app/Contents/MacOS/mvim" ]; then
		alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
		alias vimdiff="/Applications/MacVim.app/Contents/MacOS/vimdiff"
		alias gvim="/Applications/MacVim.app/Contents/MacOS/mvim"
		alias gvimdiff="/Applications/MacVim.app/Contents/MacOS/gvimdiff"
	fi

	fmount () {
		echo "mounting $1"
		osascript -e "tell application \"Finder\" to mount volume \"$1\""
	}

	dic () {
		open dict://"$@" ; say "$@"
	}

	alias hiddenDesktop="chflags hidden ~/Desktop/*"
	alias nohiddenDesktop="chflags nohidden ~/Desktop/*"

	;;
freebsd*)
	alias tbz2="tar cvyf"
	;;
esac

# }}}

# Suffix: 接尾辞エイリアス ========= {{{1

alias -s txt=cat
alias -s php="php -F"
alias -s log=less
alias -s jar="java -jar"
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
# alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=aunpack # aptitude install atool

case "${OSTYPE}" in
linux*)
	alias -s jpg=eog
	alias -s png=eog
	;;
darwin*)
	alias -s jpg=ql
	alias -s png=ql
	;;
esac

# }}}

# Global: グローバルエイリアス ===== {{{1

if which pbcopy >/dev/null 2>&1 ; then
	# Mac
	alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
	# Linux
	alias -g C='| xsel --input --clipboard'
fi

# }}}

# bindkey {{{1

#bindkey -s "vv" "!vim\n"
#bindkey -s P "ps auxw"
#bindkey -s G "| grep "
bindkey -s '5~' 'f5\n' # F5
bindkey -s '7~' 'f6\n' # F6
bindkey -s '8~' 'f7\n' # F7
bindkey -s '9~' 'f8\n' # F8

# }}}

# myabbrev {{{1
typeset -A myabbrev

myabbrev=(
	"px" "ps ax"

	"L"  "| less"
	"G"  "| grep"
	"U"  "--help | head"
	"NL" ">/dev/null"
	"NLL" ">/dev/null 2>&1"
	"UTF" "| nkf -w"
)

my-expand-abbrev() {
	local left prefix
	left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
	prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
	LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}

zle -N my-expand-abbrev

# bindkey " " my-expand-abbrev

# }}}

# END {{{1
# vim: foldmethod=marker
# }}}
