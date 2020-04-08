"author fomalhaut
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /usr/local/bin/python3.7 install --user pynvim
"command: PlugInstall
"
"
"
"base
silent exec 'language en_US'
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
scriptencoding utf-8

"plugin
call plug#begin()
"Plug 'https://github.com/vim-scripts/fcitx.vim.git'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
"Plug 'itchyny/vim-gitbranch'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale' 

call plug#end()

"UI
syntax enable
set background=dark
"colorscheme solarized
colorscheme gruvbox
set cursorline
set number

"airline
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#csv#enabled = 1
"let g:airline_theme='deus'

"lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'component': {
	\   'lineinfo': '⭡ %3l:%-2v',
	\ },
	\ 'active': {
	     \   'left': [ [ 'mode', 'paste' ],
	     \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	     \ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'gitbranch': 'LightlineFugitive',
        \   'filetype': 'DeFiletype',
        \   'fileformat': 'DeFileformat',
	\ },
	\ 'separator': { 'left': '⮀', 'right': '⮂' },
	\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
	\ }


function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction
function! DeFiletype()
return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! DeFileformat()
return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction




"ctrlp
let g:ctrlp_mruf_max = 500
let g:ctrlp_bufpath_mod = ':~:.:h'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
let g:ale_lint_delay = 1000
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
