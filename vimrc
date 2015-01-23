set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" [count] <leader> c<SPACE> comment and uncomment
" <leader> cA comment this line and add statement at the end
Plugin 'scrooloose/nerdcommenter.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
" use for current color solarized
Plugin 'altercation/vim-colors-solarized.git'
" taglist, no need more words, brilliant
Plugin 'vim-scripts/taglist.vim.git'
" find file using fuzzy search: [C-p]
Plugin 'kien/ctrlp.vim.git'
" easily get word search <leader><leader>w
Plugin 'Lokaltog/vim-easymotion.git'
" do grep: <leader>vv grep current word in this folder
" :Grep word   grep word in this folder
Plugin 'EasyGrep'
" :MRU
Plugin 'yegappan/mru.git'
" automatic complete 
Plugin 'Shougo/neocomplcache.vim.git'
" multi-line choose: <C-n> to choose, <C-x> to skip, <C-m> to previous
Plugin 'terryma/vim-multiple-cursors.git'
"cscope
Plugin 'vim-scripts/cscope.vim.git'
"surround ds to delete surround, cs{ to change, visual use S to insert 
"Plugin 'tpope/vim-surround.git'
" undo plugin F5
"Plugin 'vim-scripts/Gundo.git'
Plugin 'vim-scripts/vcscommand.vim'
"Plugin 'bling/vim-airline'
"Plugin 'scrooloose/syntastic.git'
"Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'myusuf3/numbers.vim'
" Now we can turn our filetype functionality back on
filetype plugin indent on
set tags=./tags;/
set backspace=indent,eol,start
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
if has('mouse')
  set mouse=a
endif
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
if has("autocmd")
  filetype plugin indent on
 "autocmd VimEnter * NERDTree
  augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost * 
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" key mapping
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
vnoremap <C-c> "+y
" appear setting
syntax on
syntax enable
set background=dark
"colorscheme solarized
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
colorscheme desert
set number
highlight LineNr ctermfg=grey
filetype on
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
" set plugins
" ctrlp
let g:ctrlp_working_path_mode= 'rw'
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion =1
" taglist
" let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:Tlist_Show_One_File = 1
" muitiline
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" MRU
nnoremap <C-u> :MRU<CR>
" gundo
nnoremap <F5> :GundoToggle<CR>
" nerdtree
let NERDTreeIgnore=['\.o$', '\.a$', '\.so']
let NERDTreeShowBookmarks=1
" syntastic
let g:syntastic_c_check_header = 1
" easygrep
" Number
" Easygrep
"let g:EasyGrepFileAssociations='/home/wei/.vim/bundle/EasyGrep/plugin/EasyGrepFileAssociations'
let g:EasyGrepMode=1
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=0
let g:EasyGrepHidden=0
let g:EasyGrepFilesToExclude=''
let g:EasyGrepAllOptionsInExplorer=0
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0
" end set plugins
if has('cscope')
  set cscopetag cscopeverbose
  "if has('quickfix')
    "set cscopequickfix=s-,c-,d-,i-,t-,e-
  "endif
  "if filereadable("cscope.out")
  "   cs add cscope.out
  "endif
  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help
  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
set path=$PWD/**
"set paste
