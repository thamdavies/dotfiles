# dotfiles
## Font
```bash
 brew install font-jetbrains-mono-nerd-font
```
## Ripgrep
```bash
brew install ripgrep stow
```
## Zsh
1. Install `ohmyzsh`
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
2. Install `zsh-autosuggestions`
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
3. Install `powerlevel10k`
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
## Node
#### Manually change npm's default directory
1. On the command line, in your home directory, create a directory for global installations:
```bash
mkdir ~/.npm-global
```
2. Configure npm to use the new directory path:
```bash
npm config set prefix '~/.npm-global'
```
3. In your preferred text editor, open or create a ~/.zshrc file and add this line:
```bash
export PATH=~/.npm-global/bin:$PATH
```
4. On the command line, update your system variables:
```
source ~/.zshrc
```
## Usage
```bash
stow -v -t ~ tmux
stow -v -t ~ nvim
stow -v -t ~ wezterm
stow -v -t ~ aerospace
stow -v -t ~ alacritty
```
