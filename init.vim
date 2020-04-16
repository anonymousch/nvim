"@author fomalhaut
"brew install neovim
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /usr/local/bin/python3.7 install --user pynvim
"command: PlugInstall
"
"
"

"plugin
call plug#begin()
"Plug 'https://github.com/vim-scripts/fcitx.vim.git'
Plug 'morhetz/gruvbox'
" Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'liuchengxu/eleline.vim'
Plug 'scrooloose/nerdcommenter'
"git plugin
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"等号对齐
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'

Plug 'jiangmiao/auto-pairs'
" Plug 'tacahiroy/ctrlp-funky'
"utils
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale'
"golang
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"cpp
" Plug 'universal-ctags/ctags'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'ludovicchabant/vim-gutentags'
"search
Plug 'vim-scripts/ag.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"UI
syntax enable
set background=dark
"colorscheme solarized
colorscheme gruvbox
set cursorline
set number
set t_Co=256

"base
set laststatus=2   " Always show the statusline
set showcmd
set cmdheight=1
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set magic
set cc=80
set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
"tab seting
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
"filetype
silent exec 'language en_US'
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
scriptencoding utf-8
set showtabline=2


"ctrlp
let g:ctrlp_mruf_max = 500
let g:ctrlp_bufpath_mod = ':~:.:h'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"nerdcommenter
let g:NERDSpaceDelims=1
let g:mapleader=","

"lang
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


" snippets
"
let g:UltiSnipsExpandTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
"
"
"
"lint
"
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
" let g:ale_lint_delay = 1000
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)



let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''



"
set updatetime=100

"eleline
let g:eleline_powerline_fonts = 1


"search
"
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"search cache
let g:ctrlp_use_caching = get(g:, 'ctrlp_use_caching', 500)
let g:ctrlp_clear_cache_on_exit = get(g:, 'ctrlp_clear_cache_on_exit', 1)
let g:ctrlp_cache_dir = get(g:, 'ctrlp_cache_dir', $HOME.'/.cache/ctrlp')

nnoremap <Leader>fU :execute 'CtrlSF ' . expand('<cword>')<Cr>
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_focus = {
    \ "at": "start",
    \ }
