[[ $- != *i* ]] && return

#=================================#
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s cdspell
shopt -s dirspell
shopt -s autocd
shopt -s cmdhist

#=================================#
SRCS=(
    "$HOME/.bash_env"
    "$HOME/.bash_aliases"
    "$HOME/.local/share/pyenv/bin/activate"
)
for src in "${SRCS[@]}"
do 
    [[ -s "$src" ]] && . "$src"
done
unset SRCS src

#=================================#
if ! shopt -oq posix
then
    BASH_COMPLETION=(
        /usr/share/bash-completion/bash_completion
        /etc/bash_completion
    )
    for bash_completion in "${BASH_COMPLETION[@]}"
    do
        [[ ! -e "$bash_completion" ]] && continue
        . "$bash_completion"
        break
    done
    unset BASH_COMPLETION bash_completion
fi

#=================================#
[[ -z "$NO_WELCOME" ]] && . "$HOME/.bash_welcome"

GRAY="\[\033[38;5;240m\]"
RST="\[\033[00m\]"

P1="\u$GRAY@$RST\h$GRAY"
P2="-[$RST\t$GRAY]"
P3="-[$RST\w$GRAY]$RST"
P4="$GRAY[$RST\$?$GRAY]\$$RST "

PS1="$P1$P2$P3\n$P4"
unset GRAY RST P1 P2 P3 P4
