" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

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

" 设置行号

set nu

" 不生成备份文件

set nobackup

let &termencoding=&encoding



" 设置文件编码

set fileencodings=utf-8,gbk



" 设置字体

set guifont=Consolas:h12:cANSI

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

filetype indent plugin on

set ofu=syntaxcomplete

set autoread

" 显示括号配对情况

set matchtime=1

" 显示TAB和行尾的空格

" TAB会被显示成">---"("-"的个数不一定)，而行尾多余的空白字符显示成"-"

set listchars=tab:>-,trail:-

" set nowrap



call pathogen#infect()

colorscheme github

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

	nmap <leader>e :tabnew $VIM/_vimrc<cr>

	let $VIMFILES = $VIM."/vimfiles"

endif



" 窗口切换

nnoremap <c-h> <c-w>h

nnoremap <c-l> <c-w>l

nnoremap <c-j> <c-w>j

nnoremap <c-k> <c-w>k



" 自动补全配对符号

inoremap ( ()<left>

inoremap < <><left>

inoremap [ []<left>

inoremap { {}<left>

inoremap " ""<left>

inoremap ' ''<left>