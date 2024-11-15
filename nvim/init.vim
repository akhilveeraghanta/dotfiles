"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'github/copilot.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'uarun/vim-protobuf'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-scripts/a.vim'
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
let g:rustfmt_autosave = 1

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
nmap <leader>r :registers<cr>
nmap <leader>t :tabe<cr>
nmap <leader>u :e!<cr>
nmap <leader>q :qa!<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>
nmap <leader>mp :MarkdownPreview<cr>
nmap <leader>mps :MarkdownPreviewStop<cr>
nmap <leader>ym :set mouse=""<cr>
nmap <leader>ym :set mouse=a<cr>

" smart way to move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Vim fugitive remaps
set splitbelow

command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
command QA qa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Convenience functions                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup autosave
    autocmd!
    autocmd InsertLeave * if mode() !=# 'c' | silent! wall | echo "File Saved" | endif
augroup END


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

colorscheme catppuccin-mocha
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    CoC                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HasPlugin(plugin)
    return isdirectory(expand("~/.vim/plugged/" . a:plugin))
endfunction

if HasPlugin("coc.nvim")
    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

        inoremap <silent><expr> <Tab>
              \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()

    " use shift-<tab> to navigate completion backwards
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " use <cr> to confirm completion
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " close preview window when completion is done
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    au CursorHold * sil call CocActionAsync('highlight')
    au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Pipenv complains loudly
    let $PIPENV_IGNORE_VIRTUALENVS=1

    " Formatting selected code.
    xmap <silent>=  <Plug>(coc-format-selected)
    nmap <silent>=  <Plug>(coc-format-selected)

    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:vimspector_enable_mappings = 'HUMAN'
