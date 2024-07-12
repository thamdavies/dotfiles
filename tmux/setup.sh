mkdir -p "$HOME/.config/tmux"
rm -rf "$HOME/.config/tmux/tmux.conf"
rm -rf "$HOME/.config/tmux/tmux.conf.local"

ln -s ~/personal/dotfiles/tmux/tmux.conf "$HOME/.config/tmux/tmux.conf"
ln -s ~/personal/dotfiles/tmux/tmux.conf.local "$HOME/.config/tmux/tmux.conf.local"
