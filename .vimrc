syntax on

let mapleader=" "
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set colorcolumn=80
set t_Co=256
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme elflord
let g:airline_theme='angr'

" Not sure how to get this to work properly but at least coc errors are
" readable
"hi! link CocErrorSign White
hi Quote ctermbg=109 guifg=#83a598
highlight link CocErrorSign GruvboxRed
highlight link CocWarningSign GruvboxRed
highlight link CocInfoSign GruvboxRed

highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Non specific autocmds

" Filetype specific settings
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType yaml,tf setlocal shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal wrap
autocmd BufEnter *.tfstate :setlocal filetype=json
autocmd BufEnter Jenkinsfile :setlocal filetype=groovy

" reopen file at same line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" coc calls
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>gg :CocRestart<CR>

" Nerdtree. Copypasta from readme
map <silent> <C-m> :NERDTreeFind<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeQuitOnOpen=1

" Swapping between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" split right and below instead of left and up
set splitbelow
set splitright
nnoremap <silent> <Leader>+ :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>


" Swap between tabs
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
noremap <leader>y :tabnext<CR>
noremap <leader>t :tabprevious<CR>

" Create/load session
noremap <leader>s :exe 'mks! ~/.vim/sessions/' . expand('%:t') . '.vim'<CR>
noremap <leader>S :exe 'source ~/.vim/sessions/' . expand('%:t') . '.vim'<CR>

" esc
imap jj <Esc>

"" Custom remaps
" jump backwards to space
nnoremap <leader>f F 
" golang macro
noremap <silent> <leader>if iif err != nil {<ESC>oreturn err<ESC>o}<ESC>
noremap <silent> <leader>of oif err != nil {<ESC>oreturn err<ESC>o}<ESC>
" curly brackets
noremap <silent> <leader>{ a{<CR>}<ESC>O
