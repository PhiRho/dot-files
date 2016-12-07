set -g -x PATH /apollo/env/SDETools/bin $PATH
set -g -x PATH /usr/local/bin $PATH

set SSH_AUTH_SOCK $HOME/.ssh_auth_sock
set -g -x fish_greeting 'Welcome to life, I hope you never leave.'

set -x EDITOR vim
set -x LC_ALL en_GB.UTF-8

export NVM_DIR="$HOME/.nvm"
COMMAND /usr/local/opt/nvm/nvm.sh

abbr gco git checkout 
abbr gc git commit
abbr gm git merge --no-ff
abbr gst git status
abbr ga git add
abbr grc git rebase --continue
abbr prr post-review --parent mainline -r

alias la='ll -a'
alias ssh='ssh -A'
alias glg="git log --graph --all --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
