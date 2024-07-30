1. Create `.zshrc` file
```bash
ln -s ~/personal/dotfiles/zsh/zshrc ~/.zshrc
```

3. Install `ohmyzsh`
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

5. Install `zsh-autosuggestions`
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
