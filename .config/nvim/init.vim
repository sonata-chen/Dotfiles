" Setup Plugin Manager  (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'dag/vim-fish'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
call plug#end()

" Theme
colorscheme onedark
let  base16colorspace=256
set termguicolors
colorscheme base16-tomorrow-night-eighties
" colorscheme nord
" highlight Normal ctermbg=NONE guibg=NONE

" Tab and Spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Lines and Folding
set number
set nofoldenable
set cursorline
autocmd WinEnter,BufEnter * setl cursorline
autocmd WinLeave,BufLeave * setl nocursorline

" Mutiple Windows
set splitbelow splitright


set mouse=a
set scrolloff=5
set clipboard=unnamed,unnamedplus
set history=200
set updatetime=100


" Statusline settings
" Use different statusline between focused window and unfocused

" focused window's statusline
function! Enter()
    " Left side settings
    setl statusline=
    setl statusline+=%#DiffAdd# " color code
    setl statusline+=\ 
    setl statusline+=\ %y " filetype
    setl statusline+=\ %m " modified flag
    setl statusline+=\ %r " readonly flag
    setl statusline+=\ %t " file name

    " Right side settings
    setl statusline+=%=
    setl statusline+=%#FoldColumn#  " color code
    setl statusline+=\ C[%b:%B]   " value of character under cursor
    setl statusline+=\ %c:%l/%L   " line number and column number
    setl statusline+=\ %p/%%      " percentage through file in lines
    setl statusline+=\ 
endfunction

" unfocused windows' statusline
function! Leave()
    setl statusline=
    setl statusline+=%#Visual#
    setl statusline+=\ %y
    setl statusline+=\ %m
    setl statusline+=\ %r
    setl statusline+=\ %t
endfunction

autocmd WinEnter,BufEnter * :call Enter()
autocmd WinLeave,BufLeave * :call Leave()
" autocmd WinEnter,VimEnter,BufRead,BufEnter,BufNewFile * :call Enter()

let mapleader = ","
map <leader>sv :source $MYVIMRC<CR>
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set list listchars=eol:¬,tab:▸\ ,trail:.,
