# gimme my aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# gimme my prompt
if [ -f ~/.zsh_prompt ]; then
    source ~/.zsh_prompt
fi

# gimme git branch autocomplete, initial one-time setup commented out below
# curl -o ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# make ls pretty again
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadacec

# fix my problem with calling gs outside a git repo
gs() {
    local git_status="`git status -unormal 2>&1`"
    if [[ "$git_status" =~ not\ a\ git\ repo ]]; then
        ls -F
    else
        git status
    fi
}

# spins through git repos in a directory and pulls the latest changes
# (uses same color scheme as the git prompt) 
sync() {
    local repo repos=() width=0
    for repo in */(N); do
        [ -d "$repo/.git" ] && repos+=("$repo")
    done
    for repo in $repos; do
        (( ${#repo} > width )) && width=${#repo}
    done

    for repo in $repos; do
        cd "$repo"
        local branch=$(git branch --show-current)
        local repo_esc="${${(l:$width:)repo}//\%/%%}"
        local branch_esc="${branch//\%/%%}"
        if [ "$branch" = "main" ] || [ "$branch" = "master" ] || [ "$branch" = "develop" ]; then
            if git pull --quiet > /dev/null 2>&1; then
                print -P -- "%B ${repo_esc} %K{28}%F{white} SYNCED (${branch_esc}) %b%f%k"
            else
                print -P -- "%B ${repo_esc} %K{90}%F{white} PULL FAILED (${branch_esc}) %b%f%k"
            fi
        else
            print -P -- "%B ${repo_esc} %K{94}%F{white} SKIPPING FEATURE BRANCH (${branch_esc}) %b%f%k"
        fi
        cd ..
    done
}