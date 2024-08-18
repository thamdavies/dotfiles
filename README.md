# dotfiles
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
