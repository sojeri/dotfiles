# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# gimme my aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# gimme my prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi
