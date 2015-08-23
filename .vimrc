" Ensure vim is installed via brew so we get clipboard support
" To see what is supported do `vim --version`


" https://github.com/gmarik/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Install plugins...


" Command bar/info strip
" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'


" List buffers in command bar
" https://github.com/bling/vim-bufferline
Plugin 'bling/vim-bufferline'


" File tree explorer
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'


" tmux statusline
" https://github.com/edkolev/tmuxline.vim
Plugin 'edkolev/tmuxline.vim'

" jsx extenstions
" https://github.com/mxw/vim-jsx
Plugin 'mxw/vim-jsx'

" Comment out code via gcc
" https://github.com/tpope/vim-commentary
Plugin 'tpope/commentary.vim'

" Unity
" -------------------------

" Better movement between files?
" https://github.com/Shougo/unite.vim
Plugin 'Shougo/unite.vim'

" vimproc required to grep via unite
" WARNING: needs to be compiled via `make`
" https://github.com/Shougo/vimproc.vim
Plugin 'Shougo/vimproc.vim'

" Allow unity to search to Recent Used files
" https://github.com/Shougo/neomru.vim
Plugin 'Shougo/neomru.vim'

" /Unity ------------------


" ultisnp
" -------------------------

" Track the engine.
" https://github.com/sirver/ultisnips
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Default snippets
" Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" /ultisnips --------------

" elm lang syntax highlighting
" https://github.com/lambdatoast/elm.vim
Plugin 'lambdatoast/elm.vim'

" Dash documentation plugin
" https://github.com/rizzatti/dash.vim#readme
" Plugin 'rizzatti/dash.vim'


" Comment out code via tcomment
" https://github.com/tomtom/tcomment_vim
" Plugin 'tomtom/tcomment_vim'

" Purescript code highlighting
" https://github.com/raichoo/purescript-vim
Plugin 'raichoo/purescript-vim'


" Autocompletion
" --------------------------------------------


" Code autocompletion
" https://github.com/Valloric/YouCompleteMe
" js: http://tilvim.com/2013/08/21/js-autocomplete.html
"
" Needs to be compiled
Plugin 'Valloric/YouCompleteMe'

" Better js auto completion
" https://github.com/marijnh/tern_for_vim
Plugin 'marijnh/tern_for_vim'

" Haskell autocmplation
" https://github.com/eagletmt/neco-ghc
" Plugin 'eagletmt/neco-ghc'

" / Autocompletion ---------------------------




" Theme
" Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

" End install plugins

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal



" Config plugins
source ~/.vim/config/vim-airline.vim
source ~/.vim/config/nerdtree.vim


" Other config
source ~/.vim/config/mapping.vim


" Config unite
" Access search via \f
"
" Find file
nnoremap <Leader>ff :Unite -start-insert file_rec/async<CR>
" Find directories
nnoremap <Leader>fd :Unite -start-insert file<CR>
" Find buffer
nnoremap <Leader>fb :Unite -start-insert buffer<CR>
" Find history
nnoremap <silent> <Leader>fh :Unite -start-insert -buffer-name=recent -winheight=20 file_mru<CR>
" Grep files, specify location
nnoremap <Leader>gf :Unite grep<CR>
" Grep all files
nnoremap <Leader>ga :Unite grep:.<CR>
" Clear unite caches - while unite is focussed
" http://stackoverflow.com/questions/18546533/execute-plug-commands-in-vim
" https://github.com/Shougo/unite.vim/blob/master/doc/unite.txt
nmap cc <Plug>(unite_redraw)


" Search selected text (vmode only)
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>



" Trailing whitespace
" @see: http://www.bestofvim.com/tip/trailing-whitespace/
" highlight it
match ErrorMsg '\s\+$'
" Remove trailing whitespace \rtw
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" as a function so it can be called automatically on write
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()



" Further setup

" Theme
set number
syntax enable
let g:solarized_termcolors = 256
colorscheme molokai
" let g:molokai_original = 1
let g:rehash256 = 1
set background=dark


" Tab and spacing settings
" set tabstop=4 shiftwidth=4 expandtab

" Smartcase by default (only case sensitive when Caps are inclused)
" for Case sensitive search by /helloworld\C
" note: /helloworld/c would be force case insensitve in default)
set ignorecase smartcase

set autoindent

" general setup
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab

autocmd Filetype elm setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2
autocmd Filetype js setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4


" Issue with backspace after installing YouCompleteMe
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2

" Remap esc to jj in insert mode
inoremap jj <Esc>
