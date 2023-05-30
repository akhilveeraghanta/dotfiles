# dotfiles
Contains the dotfiles for tmux, vim, bash and other related stuff. 

No garuntees.

Rough setup guidlines:

Install vimplug
- sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Install nodejs
- curl -sL https://deb.nodesource.com/setup_16.x | bash -

Install yarn
- npm install --global yarn

Now open vim and run 
:PlugInstall

Setup CoC
- cd ~/.vim/plugged/coc.vim
- yarn build

Setup Copilot in vim
:Copilot setup
