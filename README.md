# dotfiles
Contains the dotfiles for tmux, vim, bash and other related stuff. 

No garuntees.

Rough setup guidlines:

Assuming your .config file is currently empty, we're replacing it with this repo
git clone https://github.com/akhilveeraghanta/dotfiles ~/.config

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
