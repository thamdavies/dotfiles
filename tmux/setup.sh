mkdir -p "$XDG_CONFIG_HOME/tmux"
rm -rf "$XDG_CONFIG_HOME/tmux/tmux.conf"
rm -rf "$XDG_CONFIG_HOME/tmux/tmux.conf.local"

ln -s ~/personal/dotfiles/tmux/tmux.conf "$XDG_CONFIG_HOME/tmux/tmux.conf"
ln -s ~/personal/dotfiles/tmux/tmux.conf.local "$XDG_CONFIG_HOME/tmux/tmux.conf.local"
