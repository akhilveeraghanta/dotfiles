"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'github/copilot.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'honza/vim-snippets'
Plug 'kamwitsta/flatwhite-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-scripts/genutils'
Plug 'SirVer/ultisnips'
Plug 'gotcha/vimpdb'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-abolish'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'uarun/vim-protobuf'
Plug 'rakr/vim-one'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/a.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'puremourning/vimspector'
Plug 'sjl/badwolf'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    SETS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi VertSplit ctermbg=NONE guibg=NONE
hi StatusLine ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE   
hi StatusLineNC ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE
set statusline=-        " hide file name in statusline
set fillchars=stl:\     " fill active window's statusline with -
set fillchars+=stlnc:\  " also fill inactive windows
set fillchars+=vert:\  " add a bar for vertical splits
set nu
set relativenumber
set clipboard=unnamed
set hlsearch
set incsearch
set autoread
set fdo-=search
set laststatus=0
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LETS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let vim_markdown_preview_hotkey='<C-m>'
let g:UltiSnipsExpandTrigger='<C-a>'
let g:ultisnips_python_style="sphinx"
let g:easytags_async="true"
let g:ycm_use_clang=1

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
nnoremap <leader>R :!ls<CR>

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

imap jj <Esc>
nmap <leader>n :call ToggleNerdTree()<CR>
nmap <leader>f :FZF<cr>
nmap <leader>a :A<cr>
nmap <leader>p :put +<cr>
nmap <leader>mkv :mkview<cr>
nmap <leader>lv :loadview<cr>
nmap <leader>v :vsplit ..<cr>
nmap <leader>tr :vsplit<bar>:terminal ++curwin<cr>
nmap <leader>r :registers<cr>
nmap <leader>t :TagbarToggle<cr>
nmap <leader>u :e!<cr>
nmap <leader>q :qa!<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>
nmap <leader>mp :MarkdownPreview<cr>
nmap <leader>mps :MarkdownPreviewStop<cr>
nmap <leader>d :YcmCompleter GetDoc<cr>
nmap <leader>ym :set mouse=""<cr>
nmap <leader>ym :set mouse=a<cr>
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

"Vim fugitive remaps
nmap <leader>g :CocCommand fzf-preview.GitActions<CR>
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

colorscheme ayu
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set background=dark
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 FORMATTERS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal ts=4 sts=4 sw=4 formatoptions=tcroq equalprg=autopep8\ -
set nofoldenable    " disable folding

" returns true iff is NERDTree open/active
function! IsNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNTOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction
