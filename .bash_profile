source ~/.web.sh

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# added by Anaconda3 5.1.0 installer
# export PATH="/Users/jonathantang/anaconda3/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

# alias python='python3'

function shortwd() {
    num_dirs=3
    pwd_symbol="..."
    newPWD="${PWD/#$HOME/~}"
    if [ $(echo -n $newPWD | awk -F '/' '{print NF}') -gt $num_dirs ]; then
        newPWD=$(echo -n $newPWD | awk -F '/' '{print $1 "/.../" $(NF-1) "/" $(NF)}')
    fi 
    echo -n $newPWD
}

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\e[38;5;214m$(shortwd)\e[38;5;108m $(git_branch)\e[0m$ '

# export PS1="JT:\W$ "
# export PS1="JT:\W\$(parse_git_branch)\[\033[00m\]$ "

# highlighting directories
export LSCOLORS="Hxfxcxdxbxegedabagacad"
alias ls='ls -GH'

# common commands
alias q='exit'
alias c='clear'
alias pd='pwd'
alias pdc='pwd|pbcopy'

# directories
alias h='cd ~'
alias root='cd /'
alias files='cd ~/Desktop/Files'
alias gdrive='cd ~/Google\ Drive'
alias tree='tree -C'
printf "%q\n" "$(pwd)" | pbcopy

# shortcuts to vimrc and bash_profile
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'

# shortcut to opening xcode projects in xcode from terminal
alias xcode="open -a Xcode"

# reset touchbar
resettb() {
    sudo pkill "Touch Bar agent";
    sudo killall "ControlStrip";
}

# always ls after you cd
cd() {
    builtin cd "$@" && ls -GH
}

# extracting archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# pre_prompt_command() {
#     version="1.0.0"
#     entity=$(echo $(fc -ln -0) | cut -d ' ' -f1)
#     [ -z "$entity" ] && return # $entity is empty or only whitespace
#     git rev-parse --git-dir &> /dev/null && local project="$(basename $(git rev-parse --show-toplevel))" || local project="Terminal"
#     (wakatime --write --plugin "bash-wakatime/$version" --entity-type app --project "$project" --entity "$entity" 2>&1 > /dev/null &)
# }
# 
# PROMPT_COMMAND="pre_prompt_command; $PROMPT_COMMAND"
