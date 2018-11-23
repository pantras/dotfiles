### aliases

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }

alias ls="ls -G"
alias ux="chmod u+x" 
alias vimr="open -a VimR"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

### 
PS1="\u\[\033[1;34m\] \w \[\033[0m\]> "
PATH=$PATH:~/bin
PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH

function tree
{
    dir=${1:-.}
    find $dir $2 -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

function dtree
{
    dir=${1:-.}
    tree $dir "-type d" 
}

function svntree
{
    ### TODO does not work cause of -w and prepending _ in tree() output
    dtree $1 | egrep -v -w "base|.svn|test-base|props-base|entries|props|tmp"
}


export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=erasedups
export HISTIGNORE="pwd:ls:ls -ltr:"

#
CONNECT_ASCP=/Applications/"Aspera\ Connect.app"/Contents/Resources/ascp
if [[ -x $CONNECT_ASCP ]]
then
  alias ascp=$CONNECT_ASCP 
fi

source $HOME/github/oh-my-git/prompt.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
