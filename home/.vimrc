" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Change <Leader>
let mapleader = "\<Space>"

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"This is aiming to make escape / jj more instantaneous
set timeoutlen=1000 ttimeoutlen=0

" Some settings to enable the theme:
set relativenumber
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
colorscheme  gruvbox

set term=screen-256color

" PlugInstall manager
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/vim-auto-save'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'suan/vim-instant-markdown'
Plug 'pangloss/vim-javascript'
Plug 'justinj/vim-react-snippets' "vim-react-snippets:
Plug 'SirVer/ultisnips' " ultisnips
Plug 'honza/vim-snippets' " Other sets of snippets (optional)
Plug 'mxw/vim-jsx' "Jsx highlighting
" Addlugins to &runtimepath
Plug 'mitsuhiko/vim-jinja' "Jinja support
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'takac/vim-hardtime'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'sjl/vitality.vim'
Plug 'ervandew/supertab'
Plug 'othree/html5.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
call plug#end()


set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

set incsearch     " do incremental searching
set hlsearch      " press :noh to clear, might make it leader + h"
set ignorecase
set smartcase


set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set cursorline    " highlight the current line the cursor is on
set complete=.,w,b,u,t,i
set wildmenu
set textwidth=80 " Make it obvious where 80 characters is
set colorcolumn=+1
set clipboard=unnamed

let g:hardtime_default_on = 0

" Numbhers
set number
set numberwidth=5

imap <Tab> <C-P>
"sm:    flashes matching brackets or parentheses
set showmatch

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"sta:   helps with backspacing because of expandtab
set smarttab

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" Enable tab complete for commands.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu

set spelllang=en_gb


" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif


  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell


  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END



" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>



" configure syntastic syntax checking to check on open as well as save
" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
" let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:ctrlp_extensions = ['tag']
let g:ctrlp_show_hidden = 1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" NERDTree
let NERDTreeQuitOnOpen=1
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
" map enter to activating a node
let NERDTreeMapActivateNode='<CR>'
let NERDTreeIgnore=['\.DS_Store','\.pdf', '.beam']

"" Shortcuts!!

" Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Remap F1 from Help to ESC.  No more accidents.
nmap <F1> <Esc>
map! <F1> <Esc>

" <leader>F to begin searching with ag
map <leader>F :Ag<space>

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

nnoremap <leader>1 :ls<CR>:b<space>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

let g:tmux_navigator_save_on_switch = 1
autocmd InsertLeave * write

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

"show all open buffers with F5
:nnoremap <F5> :buffers<CR>:buffer<Space>

map <C-c>n :cnext<CR>
map <C-c>p :cprevious<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline#extensions#tabline#show_tab_nr = 1
" Switch into background mode
" nnoremap <leader>. <C-z>
" move among buffers with CTRL
" inoremap <C-o> my<Esc>o<Esc>`yi
"configure whether buffer numbers should be shown. >
let g:airline#extensions#tabline#buffer_nr_show = 1

" Move between splits
nnoremap <S-Tab> <C-W>W
nnoremap <Tab> <C-W><C-W>

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Cycle forward and backward through open buffers
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>

" Paste mode in and out
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>

" Create split, close split
nnoremap <leader>w <C-w>v<C-w>1
nnoremap <leader>q <C-w>q

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

"Autosave when focusing away from Vim
" au FocusLost * :wa
"
autocmd BufLeave,FocusLost,VimResized * silent! wall
"save and run last command
nnoremap <CR> :wa<CR>:!!<CR>
noremap <C-j> <ESC>:wa<CR>:!!<CR>

"open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" source vimrc
nnoremap <leader>es :so $MYVIMRC

"make ctrl-c work with vim on a mac
vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

autocmd FileType javascript inoremap (; ();<Esc>hi
set autowrite

" I'm not happy with this but I don't understand how vim/zsh work
" Maybe use tslime
set shell=/bin/sh



" " Easymotion
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)

" keep cursor column when JK motion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" Two keyletter search
nmap s <Plug>(easymotion-s2)

" such very magic
:nnoremap / /\v
:cnoremap %s/ %s/\v

" Indentation
nnoremap <Leader>i m^gg=G`^
" =========================================
" Added by Matt
" =========================================
let g:user_emmet_leader_key=','

filetype plugin on

" Vim
let g:indentLine_color_term = 239
"
" "GVim
let g:indentLine_color_gui = '#A4E57E'
"
"" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)"
" "
let g:indentLine_enabled = 1
let g:indentLine_noConcealCursor=""

"Jsx highlighting with .js files
let g:jsx_ext_required = 0


" =========================================
" Added by Roi
" =========================================

" Strip Whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" Indentation
nnoremap <Leader>i gg=G``
nnoremap == gg=G``

" Supercharges '%' to work on do-end, def-end, class-end, module-end etc.
runtime macros/matchit.vim

nnoremap <Leader>H :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Toggle relative line numbers
let g:NumberToggleTrigger="<leader>r"

set runtimepath^=~/.vim/bundle/ag

"Enable mouse
set mouse=a
"set to name of terminal
set ttymouse=xterm2


map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

"================================================
" Extra matchit for Jinja, copied from satiani/init
" ===============================================
setlocal ts=2
setlocal sw=2
setlocal sts=2

" Copied from https://github.com/marionline/dotvim/blob/master/eclim/ftplugin/htmljinja.vim
let g:HtmlJinjaBodyElements = [
      \ ['block', 'endblock'],
      \ ['call', 'endcall'],
      \ ['filter', 'endfilter'],
      \ ['for', 'endfor'],
      \ ['if', 'elif', 'else', 'endif'],
      \ ['macro', 'endmacro'],
      \ ]
" excluding 'else' on for until matchit.vim can support a duplicate word
" (doesn't break the matching of 'else' for 'if' statements.
"    \ ['for', 'else', 'endfor'],

" add matchit.vim support for jinja tags
if !exists('b:match_words')
  let b:match_words = '<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif
for element in g:HtmlJinjaBodyElements
  let pattern = ''
  for tag in element[:-2]
    if pattern != ''
      let pattern .= ':'
    endif
    let pattern .= '{%-\?\s*\<' . tag . '\>' "\_.\{-}-\?%}'
  endfor
  let pattern .= ':{%-\?\s*\<' . element[-1:][0] . '\>\s*-\?%}'
  let b:match_words .= ',' . pattern
endfor
