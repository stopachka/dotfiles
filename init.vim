call plug#begin('~/.config/nvim/autoload')
  Plug 'easymotion/vim-easymotion' " Get to where you want to go fast
  Plug 'nanotech/jellybeans.vim'   " Pretty theme

  Plug 'scrooloose/nerdtree'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim' " Fuzzy search

  Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' } " auto-pairs of parens
  Plug 'Olical/conjure', {'tag': 'v4.15.0'} " Interactive Clojure Eval
  Plug 'guns/vim-sexp' " paredi for vim
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
  Plug 'clojure-vim/clojure.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language servers for vim!
call plug#end()

" vim:foldmethod=marker:foldlevel=0

" Stopa's vimrc -- my magic sauce for getting things done!
" -----------------------------------------------------------------------------

" Vim settings {{{1
" Important {{{2
set nocompatible                        " Enable Vim features
syntax on                               " Turn on syntax highlighting
let mapleader = ","                     " Set <leader> character
let maplocalleader = ","                " Set <localleader> character
colorscheme jellybeans                  " Favorite so far
set encoding=utf-8                      " Use utf-8 when reading files
set fileencoding=utf-8                  " Files are written using utf-8
set lazyredraw                          " Don't redraw on macros -- boosts performance
set ttyfast                             " Faster redraws and smoother vim
set modelines=1                         " Read the modeline at the top

" Ignore these files in Vim's file explorer {{{2
set wildignore+="/tmp/*,*.so,*.swp,*.zip

" Make clipboard the default register {{{2
set clipboard=unnamed


" Highlight column 81 {{{2
set colorcolumn=81
highlight ColorColumn ctermbg=234

" General {{{2
set autoread                            " Reload files when outside changes made
set backspace=indent,eol,start          " Allow backspace in insert mode
set foldnestmax=2                       " Sets max fold level.
set gcr=a:blinkon0                      " Disable cursor blink
set hidden                              " Buffers can exist in background
set history=1000                        " keep 100 lines of command line history
set laststatus=2                        " lightline needs this to display status when opening first buffer
set noshowmode                          " using Lightline to show status bar instead
set noswapfile                          " Disable swap files. I don't use them
set number                              " Line numbers!
set ruler                               " show the cursor position all the time
set scrolloff=8                         " Start scrolling 8 lines away from bottom
set shortmess+=I                        " Remove Vim startup message for empty file
set showcmd                             " Show incomplete commands at bottom
set showmode                            " Show current mode down the bottom
set splitbelow                          " Default horizontal split below
set splitright                          " Default vertical split right
set visualbell                          " Disable sounds

" Wrap {{{2
set wrap
set linebreak                           " Wrap lines at convienent points
set textwidth=0
set wrapmargin=0

" Searching {{{2
set hlsearch                            " highlight searching
set incsearch                           " do incremental searching
set ignorecase                          " searches are case insensitive
set smartcase                           " unless you search with a capital letter

" Tabs and Spaces {{{2
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Key mappings {{{1
" Highlight initials in notes {{{2
:match Todo /JA:/

" Easy Navigating {{{2
:inoremap jk <Esc>
:nnoremap j gj
:nnoremap k gk

" Easy window cycling {{{2
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Easy save/quit {{{2
:noremap <leader>w :w<CR>
:nnoremap <leader>q :q!<CR>
:nnoremap <leader>zz :qa!<CR>


" Reload vimrc file {{{2
:nnoremap <silent><leader>sv :so $MYVIMRC<CR>

" Edit useful files {{{2
:nnoremap <silent><leader>ev :e $MYVIMRC<CR>
:nnoremap <silent><leader>et :e $MYTMUXCONF<CR>
:nnoremap <silent><leader>ez :e $MYZSH<CR>
:nnoremap <silent><leader>ep :e $MYPROFILE<CR>
:nnoremap <silent><leader>ed :e $MYTODOS<CR>

" Clear search {{{2
:nnoremap <silent><leader>/ :nohlsearch<CR>

" Easy command Mode {{{2
:nnoremap ; :

" Easy begin/end line navigation {{{2
:nnoremap H 0w
:nnoremap L $

" Easy clipboard copy {{{2
:vnoremap <silent><leader>c :w !pbcopy<CR><CR>

" Easy clipboard paste {{{2
:nnoremap <silent><leader>v :r !pbpaste<CR><CR>

" Easy grep under cursor {{{2
:nmap <silent><leader>r viw"ry:Ag! <C-R>r<CR><CR>

" Easy code folding {{{2
:nnoremap <Space> za

" Focus fold {{{2
:nnoremap <leader>f zMzA

" Quick newline {{{2
:nnoremap <CR> o<Esc>

" Toggle NERDTree {{{2
:nnoremap <leader>nt :NERDTree<CR>
"
" Toggle show formatting {{{2
:nnoremap <leader>l :set list!<CR>

" Window manipulation {{{2
:nnoremap <leader>\ :vsp<CR>
:nnoremap <leader>m :vertical resize 80<CR>

" Fugitive shortcuts {{{2
:nnoremap <leader>gb :Gblame<CR>


" Tab switching {{{2
:nnoremap <leader>1 1gt
:nnoremap <leader>2 2gt
:nnoremap <leader>3 3gt
:nnoremap <leader>4 4gt
:nnoremap <leader>5 5gt
:nnoremap <leader>6 6gt
:nnoremap <leader>7 7gt
:nnoremap <leader>8 8gt
:nnoremap <leader>9 9gt
:nnoremap <leader>0 :tablast<CR>
:nnoremap <leader>x :tabclose<CR>
:nnoremap <leader>t :0tabnew<CR>

" Easy fzf {{{2
nmap ; :Buffers<CR>
nmap <leader>p :Files<CR>

" Toggle paste mode {{{2
:nnoremap <leader>P :set invpaste!<CR>

" Ctags navigation {{{2
:nnoremap <leader>g <C-]>
:nnoremap <leader>b <C-t>

" Easy Ack/Ag {{{2
:nnoremap <leader>a :Ag

" Easy commenting {{{2
:nnoremap // :TComment<CR>
:vnoremap // :TComment<CR>

" Prevent overwriting default register (system clipboard) when inconvenient {{{2
:vnoremap x "_x
:vnoremap c "_c
:vnoremap p "_dP

" Don't use arrow keys in normal mode :) {{{2
:nnoremap <Left>  <NOP>
:nnoremap <Right> <NOP>
:nnoremap <Up>    <NOP>
:nnoremap <Down>  <NOP>

" In insert or command mode, move normally by using Ctrl {{{2
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Enables filetype detection and loads indent files {{{2
" Note: It's important this called after vim/bundle is added to vim's
" runtime path so that ftdetect will be loaded
" Thanks:  http://stackoverflow.com/a/19314347
filetype plugin indent on

" Set path for fzf
set rtp+=/usr/local/opt/fzf

" Use Omni-Completion
set omnifunc=syntaxcomplete#Complete

" Plugins {{{1
" Ag {{{2
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag over ack
  let g:ackprg = 'ag --vimgrep'
endif

" Lightline {{{2
" General settings
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive'
    \ },
    \ 'separator': { 'left': "", 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

" NERDTree {{{2
" Files and directories I don't want to see
" Note the use of vim-style regex
let NERDTreeIgnore = [
            \ '\.\(pyc\|swp\|db\|coverage\|DS_Store\)$',
            \ '\.\(git\|hg\|svn\|egg-info\)$[[dir]]',
            \ '\(coverage\|pytests\)\.xml$',
            \ ]

" I do want to see dotfiles (like .gitignore)
let NERDTreeShowHidden=1

" Pretty NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-javascript {{{2
" Enable syntax highlighting for flow
let g:javascript_plugin_flow = 1

" vim-jsx-pretty {{{2
" Colorful style
let g:vim_jsx_pretty_colorful_config = 1

" vim-prettier {{{2
" Run prettier async
let g:prettier#exec_cmd_async = 1

" Custom functions {{{1
" Strip whitespace and save cursor position {{{2
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Displays current git branch in powerline {{{2
function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\u00A7 "._ : ''
  endif
  return ''
endfunction
" }}}

" Autocommands {{{1
augroup configgroup
    " Clear previous autocmds
    autocmd!

    " White Space Settings for different file types {{{2
    autocmd FileType python setlocal ts=4 sts=4 sw=4 et
    autocmd FileType javascript,jsx,tsx setlocal ts=2 sts=2 sw=2 et
    autocmd FileType css setlocal ts=2 sts=2 sw=2 et
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    autocmd FileType html,htmljinja setlocal ts=2 sts=2 sw=2 et

    " Clean up trailing white spaces {{{2
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Python folding {{{2
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal foldlevel=0

    " Javascript folding {{{2
    au FileType javascript,jsx,tsx setlocal foldmethod=syntax
    au FileType javascript,jsx,tsx setlocal foldlevel=1

    " Rainbow-ify parens/brackets for selected file types {{{2
    au FileType javascriptreact,jsx call rainbow#load()

    " Enable vim-jinja highlighting for .jinja files {{{2
    autocmd BufNewFile,BufRead *.jinja set filetype=htmljinja

    " Trigger autoread whenever I switch buffer or when focusing vim again {{{2
    " Thanks: http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work/20418591#20418591
    au FocusGained,BufEnter * :silent! !

    " Save whenever switching between windows and buffers {{{2
    au FocusLost,BufLeave,WinLeave * :silent! w

    " Close the Omni-Completion tip window when a selection is made {{{2
    " These lines close it on movement in insert mode or when leaving insert mode
    " Thanks:
    " http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}} End section

augroup END

" Conjure {{{1
let g:conjure#highlight#enabled = v:true
" }}}

" COC {{{1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap keys for gotos
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>ax <Plug>(coc-codeaction-line)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>u <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

" Diagnostics
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

" Fix autofix problem of current line
nmap <leader>aq  <Plug>(coc-fix-current)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
 function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction

" }}} End Section

" Source private vimrc {{{1
if filereadable(expand("~/.vim/vimrc.private.after"))
  source ~/.vim/vimrc.private.after
endif
