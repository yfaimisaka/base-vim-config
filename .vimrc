""""""""""""""""
""" comm set """
""""""""""""""""
"" To enabel netrw
" set nocompatible
set nocp 

set hidden    " hide warn when change unsaved buffer

set relativenumber
set number

" set indent
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab " transfer tab to space
set autoindent



syntax enable " enalbe syntax hightlight

" enable built-in plugin on filetype

set showcmd

" set times `u` can to undo changes
set undolevels=1000
filetype plugin on 

" use ripgrep when using `:vim` or `:grep`
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" set undodir(where save the .undo file)
" and set undofile(means starting undo func on the file you save and quit,
" while not get 'Already at oldest change'
" normally you can use `wundo! xxx.undo` to create an undo file and `rundo
" xxx.undo` to read undo history when reopen a closed 
" and the folloing will automatically do this
set undodir=~/.vim/undo_dir
set undofile

" all smallcase -> ignorecase
" one char is upercase -> noignorecase
set ignorecase smartcase

" set foldmethod 
set foldmethod=syntax

" set keymap timeout
set timeoutlen=400

"""""""""""""""""
""" vim-plug """
"""""""""""""""""
call plug#begin()
" fuzz search for file and content
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" plugin to show the content of registers when enter `"` in normal mode or `C-r`
" in insert mode
Plug 'junegunn/vim-peekaboo' 

" better naviga in tmux - vim
Plug 'christoomey/vim-tmux-navigator'

" plugin to show undotree
Plug 'simnalamburt/vim-mundo'
call plug#end()


"""""""""""""""""
""" key map """
"""""""""""""""""
" let mapleader = "\<Space>"
let mapleader = " "

" convinient save and quit
nnoremap <silent> <leader>w :w<CR>     
nnoremap <silent> <leader>wq :wq<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>qa :wqall<CR>

nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>' :Marks<CR>
nnoremap <silent> <leader>g :Commits<CR>
nnoremap <silent> <leader>H :Helptags<CR>
nnoremap <silent> <leader>hh :History<CR>
nnoremap <silent> <leader>h: :History:<CR>
nnoremap <silent> <leader>h/ :History/<CR>

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"""""""""""""""
""" autocmd """
"""""""""""""""
" auto update ctags after `w`
autocmd BufWritePost *.[rs|py|go|java] silent !ctags -R .

