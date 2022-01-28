if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x FISH_HOME "$HOME/dotfiles/fish"
set fish_greeting


source "$FISH_HOME/env.fish"
source "$FISH_HOME/alias.fish"
