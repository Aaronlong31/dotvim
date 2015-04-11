" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set laststatus=2
" 设置行号
set nu
" 不生成备份文件
set nobackup
let &termencoding=&encoding
" 设置文件编码
set fileencodings=utf-8,gbk
" 设置字体
" set guifont=Monospace\ 12,Source\ Code\ Pro\ 12,Consolas:h12:cANSI
" 用4个空格代替TAB
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 不生成swap file
set noswapfile
" 不适用兼容模式
set nocompatible
" 高亮搜索
set hlsearch
" 增量搜索
set incsearch
" 搜索忽略大小写
set ignorecase
" 自动缩进
set autoindent
" 智能缩进
set smartindent
" 显示对应的括号
set showmatch
" 语法高亮
syntax on
set go="无菜单、无工具栏"
filetype indent plugin off
set ofu=syntaxcomplete
set autoread
" 显示括号配对情况
set matchtime=1
" 显示TAB和行尾的空格
" TAB会被显示成">---"("-"的个数不一定)，而行尾多余的空白字符显示成"-"
set listchars=tab:>-,trail:-
" set nowrap
" 自动切换当前目录为当前文件所在的目录
set autochdir
set smartcase
" 关闭错误声音
set noerrorbells
set novisualbell
" 显示TAB符
" set list
set t_vb=
set fileformats=unix,dos,mac
" 编辑vim配置文件
if has("unix")
	nmap <leader>e :tabnew $HOME/.vimrc<cr>
	let $VIMFILES = $HOME."/.vim"
else
	nmap <leader>e :tabnew $HOME\vimfiles\vimrc<cr>
	let $VIMFILES = $VIM."/vimfiles"
endif

if has("unix")
    nmap <leader>j :%!python -m json.tool<cr>
endif

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

if has("unix")
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
    set t_Co=256
    colorscheme molokai
endif
Bundle 'gmarik/vundle'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'Tagbar'
Bundle 'taglist.vim'
Bundle 'molokai'
Bundle 'mattn/emmet-vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'WebAPI.vim'
Bundle 'Gist.vim'
Bundle 'YankRing.vim'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'

Bundle 'Lokaltog/powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'

Bundle 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

Bundle 'skammer/vim-css-color'
Bundle 'terryma/vim-expand-region'
Bundle 'tomasr/molokai'
colorscheme molokai

Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0


"################# 具体语言语法高亮 ###############

" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

filetype plugin indent on 
"let g:AutoComplPop_IgnoreCaseOption = 1
"set ignorecase
"let g:acp_behaviorKeywordCommand = "\<C-x>\<C-o>"
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
map <S-m> <plug>NERDTreeTabsToggle<CR>
let g:NERDTreeWinSize = 50
let g:tagbar_width = 20
let g:use_zen_expandabbr_key='<S-O>'
let g:use_zen_complete_tag = 1

Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1

let g:gist_detect_filetype = 1
let g:gist_clip_command = 'xclip -selection clipboard'

nnoremap <silent> <C-F7> :TlistToggle<CR>
map <C-P> :FufCoverageFile<CR>
map! <C-P> :FufCoverageFile<CR>
autocmd BufNewFile,BufRead *.json set ft=json
augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END 
autocmd BufNewFile,BufRead *.gradle set ft=groovy
