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
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set colorcolumn=80
set t_Co=256
set autoread
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
autocmd FileType go setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
autocmd FileType yaml,tf,hcl setlocal shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal wrap
autocmd FileType json setlocal t_Co&
autocmd FileType json highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
autocmd BufEnter *.tfstate :setlocal filetype=json
autocmd BufEnter *.tf :setlocal filetype=tf
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

" coc calls + copypasta
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>[g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>gg :CocRestart<CR>
" Refresh on space
inoremap <silent><expr> <c-space> coc#refresh()

" Nerdtree. Copypasta from readme
map <silent> <C-m> :NERDTreeFind<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

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

" Create/load session
nnoremap <leader>s :exe 'mks! ~/.vim/sessions/' . expand('%:t') . '.vim'<CR>
nnoremap <leader>S :exe 'source ~/.vim/sessions/' . expand('%:t') . '.vim'<CR>

" quick escape
imap jj <Esc>

"" Custom remaps
" jump backwards to space
nnoremap <leader>f F 
" golang macro
nnoremap <silent> <leader>if iif err != nil {<CR>return err<CR>}<ESC>
nnoremap <silent> <leader>of oif err != nil {<CR>return err<CR>}<ESC>
nnoremap <silent> <leader>af oif err != nil {<CR>return <CR>}<ESC>kA
" curly brackets
imap {} {<CR>}<ESC>O
" jump around
nnoremap <silent> <leader>j 10j
nnoremap <silent> <leader>n 5j
nnoremap <silent> <leader>k 10k
nnoremap <silent> <leader>m 5k
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" fzf ctrlp
nnoremap <silent> <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-u': 'split',
  \ 'ctrl-s': 'vsplit' }

" terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <silent> <C-d> <C-\><C-n>:bd!<CR>
tnoremap jj <C-\><C-n>
" autocmd BufWinEnter,WinEnter term://* :setlocal nonu
autocmd BufEnter * if &buftype == 'terminal' | exec 'normal! i' | endif
let g:hidden_term = 0
function TerminalModeSettings()
    setlocal nonu
    tnoremap <silent> u <C-\><C-n>:call HideTerminal()<CR>
endfunction
function HideTerminal()
    let g:hidden_term = bufnr("%")
    hide
endfunction
function EnterTerminal(type)
    if g:hidden_term
        let l:hidden_term = g:hidden_term
        let g:hidden_term = 0
        exec a:type . 'sb ' . l:hidden_term
    else
        terminal bash
    endif
endfunction

autocmd BufEnter,TerminalOpen * if &buftype == 'terminal' | exec TerminalModeSettings() | endif
nnoremap <silent> y :call EnterTerminal("tab ")<CR>
nnoremap <silent> u :call EnterTerminal("")<CR>
nnoremap <silent> i :call EnterTerminal("vert ")<CR>
