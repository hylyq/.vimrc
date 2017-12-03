set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}



Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'   "自动缩进
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'bitc/vim-bad-whitespace'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




set encoding=utf-8 "支持UTF-8编码

set nu            "显示行号
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4     " 设定 tab 长度为 4
set shiftwidth=4  "设置 智能缩进的宽度
set expandtab     "设置 将 tab 转换为 4 个空格




set cursorcolumn
set cursorline  " or  set cuc  set cul
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE








let mapleader = "\<Space>"

"使用 <Space>o 创建一个新文件:
"nnoremap <Leader>o :CtrlP<CR>
"使用 <Space>w 保存文件
"nnoremap <Leader>w :w<CR>

"文件保存与退出
nmap fw     :w<CR>
nmap fq     :q<CR>
nmap fwq    :wq<CR>



"nnoremap <Leader>g :TlistOpen<CR>
nnoremap <Leader>g :TagbarToggle<CR>
let g:tagbar_width = 21
let g:tagbar_autofocus = 1 "If you set this option the cursor will move to the Tagbar window when it is opened.
let g:tagbar_compact = 1
"let g:tagbar_autopreview = 1
"let g:tagbar_previewwin_pos = "aboveleft"
let g:tagbar_autoclose = 1




" NERDTree config
nnoremap <Leader>d :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree "打开vim时自动打开NERDTree
let NERDTreeMinimalUI=1 "disables the 'Bookmarks' labor 'Press ? for help' text.
let NERDTreeWinSize=20



"在插入模式下连按jj就相当于按下了esc
inoremap jj <esc>


nmap <S-d> <C-b>
nmap <S-c> <C-f>
nmap <S-w> <C-w>
nmap <S-]> <C-]>
nmap <S-t> <C-t>






map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
		exec "w"
		if &filetype == 'c'
				exec "!g++ % -o %<"
				exec "!time ./%<"
		elseif &filetype == 'cpp'
				exec "!g++ % -o %<"
				exec "!time ./%<"
		elseif &filetype == 'java'
				exec "!javac %"
				exec "!time java %<"
		elseif &filetype == 'sh'
				:!time bash %
		elseif &filetype == 'python'
				exec "!time python %"
		elseif &filetype == 'html'
				exec "!firefox % &"
		elseif &filetype == 'go'
				"        exec "!go build %<"
				exec "!time go run %"
		elseif &filetype == 'mkd'
				exec "!~/.vim/markdown.pl % > %.html &"
				exec "!firefox %.html &"
		endif
endfunc
