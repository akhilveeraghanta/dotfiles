# dotfiles
Contains the dotfiles for tmux, vim, bash and other related stuff. 

No garuntees.

Rough setup guidlines:

Checkout repo into wherever you keep repos

Copy init.vim to ~/.config/nvim/
- Install neovim using snap (v0.9.0)
- Install vimplug for neovim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Install nodejs
you need to run sudo sh first
- curl -sL https://deb.nodesource.com/setup_16.x | bash -

Make sure to follow the instructions to install node that print after the script runs

Install yarn
- npm install --global yarn

Now open vim and run 
:PlugInstall

Setup CoC
- cd ~/.vim/plugged/coc.vim
- yarn install

Setup Copilot in vim
:Copilot setup
