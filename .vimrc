""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'xolox/vim-easytags', {'do':'sudo apt-get install exuberant-ctags'}
Plug 'xolox/vim-misc'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/genutils'
Plug 'hellosputnik/vim-plugin' 
Plug 'akhilveeraghanta/gethelp'
Plug 'jinhkim/vim-snippets', { 'branch': 'work_snippets' }
Plug 'gotcha/vimpdb'
Plug 'fcpg/vim-fahrenheit'
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mnpk/vim-jira-complete'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'
Plug 'jgdavey/tslime.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    SETS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set relativenumber
set clipboard=unnamed
set hlsearch
set incsearch
set autoread
set fdo-=search


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LETS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let vim_markdown_preview_hotkey='<C-m>'
let g:ultisnips_python_style="sphinx"
let g:jiracomplete_url = 'http://ecoation.atlassian.net/'
let g:jiracomplete_username = 'akhil@ecoation.com'

let test#strategy = {
  \ 'nearest': 'dispatch',
  \ 'file':    'vimterminal',
  \ 'suite':   'basic',
\}

imap <silent> <unique> <leader>j <Plug>JiraComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   REMAPS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
nnoremap <leader>y "+y
xnoremap <leader>y "+y

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR> 

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hu <Plug>GitGutterUndoHunk

nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>f :FZF<cr>
nmap <leader>p :put +<cr>
nmap <leader>mkv :mkview<cr>
nmap <leader>lv :loadview<cr>
nmap <leader>v :vsplit ..<cr>
nmap <leader>tr :vsplit<bar>:terminal ++curwin<cr>
nmap <leader>r :registers<cr>
nmap <leader>t :TagbarToggle<cr>
nmap <leader>u :e!<cr>
nmap <leader>mp :MarkdownPreview<cr>
nmap <leader>mps :MarkdownPreviewStop<cr>
nmap <leader>g :Goyo<cr>
nmap <leader>d :YcmCompleter GetDoc<cr>
nmap <leader>ym :set mouse=""<cr>
nmap <leader>ym :set mouse=a<cr>
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

"Vim fugitive remaps
nmap <leader>gs :Gstatus<CR><C-w>=<C-w>30-
set splitbelow

command WQ wq
command Wq wq
command W w
command Q q
command Qa qa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   THEMES                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set guioptions-=m " turn off menu bar
set guioptions-=T " turn off toolbar
set guioptions-=L " turn off menu bar
set backspace=indent,eol,start
set laststatus=2  " always display the status line
set background=dark
colorscheme PaperColor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 FORMATTERS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python formatting
autocmd FileType python setlocal ts=4 sts=4 sw=4 formatoptions=tcroq equalprg=autopep8\ -
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif
set nofoldenable    " disable folding
