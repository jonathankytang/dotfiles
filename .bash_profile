source ~/.web.sh
source ~/.git.sh

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

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

# always ls after you cd
cl() {
    builtin cd "$@" && ls -GH;
}

cd() {
    cl "$@";
}

# highlighting directories
export LSCOLORS="Hxfxcxdxbxegedabagacad"
alias ls='ls -GH'

# common commands
alias c='clear'
alias pd='pwd'
alias pdc='pwd|pbcopy'

# directories
alias h='cl ~'
alias root='cl /'
alias proj='cl ~/projects'
alias gdrive='cl ~/Google\ Drive'
alias onedrive='cl ~/Documents/OneDrive\ -\ UCL/'
alias 1='cl ~/Documents/OneDrive\ -\ University\ College\ London/1-Financial_Engineering/'
alias 2='cl ~/Documents/OneDrive\ -\ University\ College\ London/2-Digital_Finance/'
alias 3='cl ~/Documents/OneDrive\ -\ University\ College\ London/3-Numerical_Methods_for_Finance/'
alias 4='cl ~/Documents/OneDrive\ -\ University\ College\ London/4-Financial_Institutions_and_Markets/'
alias 5='cl ~/Documents/OneDrive\ -\ University\ College\ London/5-Applied_Computational_Finance/'
alias 6='cl ~/Documents/OneDrive\ -\ University\ College\ London/6-Data_Science/'
alias 7='cl ~/Documents/OneDrive\ -\ University\ College\ London/7-Algorithmic_Trading/'
alias 8='cl ~/Documents/OneDrive\ -\ University\ College\ London/8-Machine_Learning_with_Applications_in_Finance/'
alias tree='tree -C'
printf "%q\n" "$(pwd)" | pbcopy

# shortcuts to vimrc and bash_profile
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bash_profile'

# shortcut to opening xcode projects in xcode from terminal
alias xcode="open -a Xcode"

# run jupyter
alias jl='jupyter lab'
alias jp='jupyter notebook'

# run htop
alias htop="sudo htop"

# weather
alias weather="curl http://wttr.in/"

# always run c++14
alias g++='g++ -std=c++14'

# shortcu~t to run q
alias q='QHOME=~/q rlwrap -r ~/q/m64/q'

# reset touchbar
resettb() {
    sudo pkill "Touch Bar agent";
    sudo killall "ControlStrip";
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

# slience bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Nodejs
export NODE_PATH='/usr/local/lib/node_modules'
