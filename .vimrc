set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
syntax on

"Package manager
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation; fetches github.com
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'vim-perl/vim-perl'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
call plug#end()

set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set mouse=
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set number  "Enables line numbering
set smarttab
set tabstop=4
set shiftwidth=4
set listchars=tab:\|_
set lcs+=space:·
set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set title
set titleold=""
set titlestring=%F
set noswapfile
set paste
set magic
set foldmethod=manual  "Lets you hide sections of code
set splitright
set background=dark
set clipboard=unnamedplus
colors elflord

"--- file types
au BufRead,BufNewFile *.foundationrules,*.rules,*.load set filetype=perl

"--- The following commands make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
"--- Ends navigation commands

function NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"--- Leader assignment and commands
let mapleader = ","
nmap <Leader>v :tabnew $MYVIMRC<CR>
nmap <Leader>mv :source $MYVIMRC<CR>
nmap <Leader>n :nohl<CR>
vmap <Leader>c :w !pbcopy<CR><CR>
nmap <Leader>mk :mksession! ~/.vim/session/
nmap <Leader>g :Ag
nmap <Leader>u :set nu!<CR>
"May need this....
nmap <Leader>s :tabo<CR>:Startify<CR>
"--- Quick hack to close quickfix window when it doesn't have focus
nmap <Leader>q <C-w>wq

set t_Co=256

if has('gui_running')
  set guifont=CourierNew:h11
endif

"--- Ctrl-P config
cd ~/dev/
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_map = '<c-x>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.svn$\|\.git$\|\.npmignore$\|\.gitignore$|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.ico*|\.DS_Store$|\.gitignore$|\.bower.*$|\.*rc$'
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.svn/*,\*.DS_Store

"--- Tab configuration
nmap tn :tabnew<CR>
nmap tl :tablast<CR>
nmap tf :tabfirst<CR>
nmap ) :tabnext<CR>
nmap ( :tabprev<CR>

autocmd VimEnter * wincmd p
autocmd BufWritePre * :%s/\s\+$//e
au BufRead,BufNewFile *.js set filetype=jquery
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.rules set filetype=perl
au BufRead,BufNewFile *.def set filetype=json

nnoremap n nzzzv
nnoremap N Nzzzv
function! SearchWord(word)
    let @/ = '\<' . a:word . '\>'
normal n
endfunction
command! -nargs=1 SearchWord call SearchWord(<f-args>)
nmap ? :SearchWord
hi Search cterm=NONE ctermfg=white ctermbg=blue
hi Visual cterm=NONE ctermfg=white ctermbg=blue
vnoremap < <gv
vnoremap > >gv
nnoremap <NL> i<CR><ESC>


"Custom plugin stuff
let g:EasyMotion_leader_key = 'Q'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }
set noshowmode

