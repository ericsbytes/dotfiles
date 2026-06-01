eval "$(zoxide init bash)"

alias l='ls -lah'

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi