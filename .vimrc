" VIM setting.
" Szu-Yu Chen (Aknow)


"------------------------------------------------------------------------------
" Install vundle automatically
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"------------------------------------------------------------------------------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif


"------------------------------------------------------------------------------
" Vundle setting.
"------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/The-NERD-tree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'msanders/snipmate.vim'
Plugin 'neilagabriel/vim-geeknote'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------------------------------------------------------------------------------
" Install plugins automatically
"------------------------------------------------------------------------------
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
    :qall
endif


"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------
autocmd! bufwritepost .vimrc source ~/.vimrc

set laststatus=2
set nu
set cursorline
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set nocompatible
set backspace=2
set t_ti= t_te=



"------------------airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '►'
let g:airline_right_sep = '◄'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'ῲ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'



"-----------------NerdTree
nnoremap <silent> <F6> :NERDTreeToggle<CR>



"Showing the ExtraSpace in Red
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif


"---------gitgutter----------
let g:gitgutter_enabled = 1
highlight GitGutterChange ctermfg=yellow ctermbg=darkgrey
highlight GitGutterAdd ctermfg=white ctermbg=green
highlight GitGutterDelete ctermfg=white ctermbg=red


set noshowmode
nmap <F5> :set mouse=a<CR>

"--------TagBar--------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"--------when opened,will return to the last edit position
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

"---------Geeknote-------------
noremap <F7> :Geeknote<cr>
let g:GeeknoteFormat="markdown"
autocmd FileType geeknote setlocal nonumber

set hlsearch
hi Search ctermbg=red ctermfg=white

"-------------Showing the indenting line-----
set list
set listchars=tab:¨\ 

"------------Disable the highlight----------
noremap <F4> :nohl<CR>
