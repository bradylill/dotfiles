set -gx NODE_LTS_GALLIUM (cat ~/.nvm/alias/lts/gallium)
set -gx PATH /usr/local/sbin /usr/bin /usr/sbin /usr/local/bin
fish_add_path -P ~/bin ~/local/bin ~/.local/bin ~/dotfiles/bin /usr/local/bin ~/.npm-global/bin ~/.rbenv/shims ~/.rbenv/bin ~/.cargo/bin ~/.pyenv/bin ~/.pyenv/shims ~/.fzf/bin ~/.nvm/versions/node/$NODE_LTS_GALLIUM/bin
set -gx SHELL (which fish)
set -gx SUDO_EDIT (which nvim)
set -gx EDITOR (which nvim)
set -gx TERM tmux-256color
set -gx NVM_DIR $HOME/.nvm
set -gx GPG_TTY (tty)

if command -vq fzf
  set -x FZF_TMUX 1
  set -x FZF_TMUX_HEIGHT 31
  set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*"'
  set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
end

if command -vq go
  set -x GOPATH $HOME/go
  set -x GOROOT /usr/local/opt/go/libexec
  fish_add_path -P $GOPATH/bin $GOROOT/bin
end

if test (umask) = "000"
  umask 022
end

function agent-attach
  if command -vq keychain
    keychain $HOME/.ssh/id_rsa
    source $HOME/.keychain/$NAME-sh
  else
    echo "Command 'keychain' not found"
  end
end

if command -vq rbenv
  rbenv init - | source
end

function init-pyenv
  pyenv init - | source
  pyenv virtualenv-init - | source
end

if command -vq pyenv
  init-pyenv
end

# TODO: fix with fish
#if test -s "$NVM_DIR/nvm.sh"
  #source "$NVM_DIR/nvm.sh"
#end

# TODO: fix with fish
#rename() {
  #for i in $1*
  #do
    #mv "$i" "${i/$1/$2}"
  #done
#}
