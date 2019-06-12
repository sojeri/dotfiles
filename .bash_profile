# gimme my aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# gimme my prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

# make ls pretty again
export CLICOLOR=1

# fix my problem with calling gs outside a git repo
gs() {
    local git_status="`git status -unormal 2>&1`"
    if [[ "$git_status" =~ not\ a\ git\ repo ]]; then
        ls -F
    else
        git status
    fi
}

# gimme direnv but always last
eval "$(direnv hook bash)"
