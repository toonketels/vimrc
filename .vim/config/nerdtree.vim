" Nerdtree is a file tree explorer
" https://github.com/scrooloose/nerdtree

" Toggle nerdtree via CTRL n
map <C-n> :NERDTreeToggle<CR>


" Auto close vim when NERDTree is last window around
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




