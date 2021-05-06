syntax on

let mapleader=" "
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=/home/vagrant/.config/nvim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set colorcolumn=120
set t_Co=256
set autoread
set shadafile=/home/vagrant/.config/nvim/viminfo
set scrolloff=8
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'vim-python/python-syntax'
Plug 'zigford/vim-powershell'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"highlight Normal ctermbg=238
colo gruvbox
let g:airline_theme='angr'

highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" quick escape
imap jj <Esc>

" Non specific autocmds

" Filetype specific settings
autocmd FileType go setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab
autocmd FileType markdown setlocal wrap
autocmd FileType json setlocal t_Co&
autocmd FileType json highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
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
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>gk :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>gg :CocRestart<CR>
" Refresh on space
inoremap <silent><expr> <c-space> coc#refresh()
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Nerdtree. Copypasta from readme
nnoremap <silent> <C-m> :NERDTreeFind<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <silent> <A-n> :cnext<CR>
nnoremap <silent> <A-m> :cprev<CR>

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
" Tabs for terminal mode
" tnoremap <leader>1 <C-\><C-n>1gt
" tnoremap <leader>2 <C-\><C-n>2gt
" tnoremap <leader>3 <C-\><C-n>3gt
" tnoremap <leader>4 <C-\><C-n>4gt
" tnoremap <leader>5 <C-\><C-n>5gt
" tnoremap <leader>6 <C-\><C-n>6gt
" tnoremap <leader>7 <C-\><C-n>7gt
" tnoremap <leader>8 <C-\><C-n>8gt
" tnoremap <leader>9 <C-\><C-n>9gt
" Move splits using alt
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"" Custom remaps
" golang macro
nnoremap <silent> <leader>if iif err != nil {<CR>return err<CR>}<ESC>
nnoremap <silent> <leader>of oif err != nil {<CR>return err<CR>}<ESC>
nnoremap <silent> <leader>af oif err != nil {<CR>return <CR>}<ESC>kA
" curly brackets
imap {<Space>} {<CR>}<ESC>O
" jump around
nnoremap <silent> <leader>j 10j
nnoremap <silent> <leader>k 10k
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l
nnoremap <C-j> 5j5<C-e>
nnoremap <C-k> 5k5<C-y>
nnoremap <C-h> H
nnoremap <C-l> L
vnoremap J 5j
vnoremap K 5k
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nnoremap <space><space> zz
" dismiss search highlights
nnoremap <silent> <leader>n :noh<CR>

" fzf ctrlp
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <A-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-u': 'split',
  \ 'ctrl-s': 'vsplit' }
" Find word under cursor
nnoremap <silent> <leader>rg :Rg <cword><CR>

" terminal
tnoremap <silent> <C-d> <C-\><C-n>:bd!<CR>
tnoremap jj <C-\><C-n>
" autocmd BufWinEnter,WinEnter term://* :setlocal nonu
autocmd TermOpen * exec 'normal! i'
let g:hidden_term = 0
function TerminalModeSettings()
    setlocal nonu
    tnoremap <silent> <A-u> <C-\><C-n>:call HideTerminal()<CR>
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
        if a:type == "tab "
            :tabedit term://bash
        elseif a:type == ""
            :edit term://bash
        elseif a:type == "vert "
            :split term://bash
        endif
    endif
endfunction

autocmd BufWinEnter,WinEnter,BufEnter term://* :exec 'normal i'
autocmd TermOpen * exec TerminalModeSettings()
nnoremap <silent> <A-y> :call EnterTerminal("tab ")<CR>
nnoremap <silent> <A-u> :call EnterTerminal("")<CR>
nnoremap <silent> <A-i> :call EnterTerminal("vert ")<CR>

" line folding
set foldmethod=syntax
set nofoldenable

" Remove trailing whitespace
nnoremap <silent> <leader>w :%s/\s\+$//e<CR>
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <silent> <leader>c :call SynGroup()<CR>

let g:python_highlight_all = 1

" TreeSitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

