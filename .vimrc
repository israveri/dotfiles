set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'daviesjamie/vim-base16-lightline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'upAndDown'
Plugin 'tpope/vim-surround'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sheerun/vim-polyglot'

call vundle#end()

syntax on

filetype on
filetype plugin indent on

"""""""""""""""""""""""""""
" Basic configuration
"""""""""""""""""""""""""""
" fixes
if &term =~ '256color'
  " Fixes screen/tmux colorspace and allows
  " Vim to recognize Shift, Ctrl and Alt keys
  set t_ut=
endif

" indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ui & interface
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set background=light
set number

" split navigation
nnoremap <C-Left> <C-w><C-h>
nnoremap <C-Right> <C-w><C-l>
nnoremap <C-Up> <C-w><C-k>
nnoremap <C-Down> <C-w><C-j>

" bells (disable)
set vb
set t_vb=

" search
set smartcase
set hlsearch
set incsearch
nnoremap <C-L> :noh<CR><C-L>

" mouse support
set mouse=a

" disable swap files
set noswapfile

"""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'base16',
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

"""""""""""""""""""""""""""
" Ag - The Silver Searcher
"""""""""""""""""""""""""""
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <F3> :Ag!<Space>

"""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
nnoremap <F7> :SyntasticCheck<CR>
nnoremap <C-w>l :SyntasticReset<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': []
  \ }

" Checkers
let g:syntastic_ruby_checkers = ['rubocop', 'ruby-lint']

"""""""""""""""""""""""""""
" FileTypes customizations
"""""""""""""""""""""""""""
augroup filetypesgroup
  autocmd!
  autocmd BufNewFile,BufRead *.app set filetype=erl
augroup END
