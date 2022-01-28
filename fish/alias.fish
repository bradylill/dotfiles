alias rld="source ~/.config/fish/config.fish"
alias pwdc="pwd | pbcopy"

alias gst="git status"
alias gco="git checkout"
alias gs="gst -s"
alias gc="git commit"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"

alias ll="ls -l"
alias l="ls -la"

alias dm="docker-machine"
alias dme="source dm-switch-env"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcp="docker-compose ps"
alias dcl="docker-compose logs -f"
function dclc
  docker-compose logs -f (basename $PWD)
end

alias e="nvim"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias spf="ssh -f -N"
alias ccli="circleci"
alias fpsk="fzf-ps-kill"
alias aa=". ssh-agent-attach"
alias k8="kubectl"
