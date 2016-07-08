
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Global Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set nu
set showmatch
set nocompatible
syntax enable
syntax on
set laststatus=2
set ai
set bs=2
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set cursorline
set cursorcolumn
set autoread
set ignorecase
set foldmethod=syntax
set nofoldenable

colorscheme molokai 
let g:molokai_orininal=1
let g:rehash256=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle.vim Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle.vim required this option
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins List
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'mattn/emmet-vim'

Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'
Bundle 'Valloric/ListToggle'

Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'

Bundle 'taglist.vim'
Bundle 'scrooloose/syntastic'


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
"
" Just Run Bundle Install

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"powerline{
set guifont=Ubuntu\ Mono\ derivative\ Powerline
set t_Co=256
set encoding=utf8
"}

"vim-indent-guides{
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"}

"indentLine{
map <leader>il :IndentLinesToggle<CR>
"}

"nerdtree{
autocmd vimenter * NERDTree
wincmd w
autocmd vimenter * wincmd w
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
"nmap <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUT=1
let NERDTreeAutoDeleteBuffer=1
"}

"vim-emmet{
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
"}

"YouCompleteMe{
let g:ycm_error_symbol   = '>E'
let g:ycm_warning_symbol = '>W'


" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=./.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
"Scratch Preview 放到最下面
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

let g:ycm_max_diagnostics_to_display = 30
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

let g:ycm_min_num_of_chars_for_completion=0
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = { '*': 1 }

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
let g:syntastic_always_populate_loc_list=1

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

"}

"vim-commentary{
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType mako set cms=##\ %s
"}

"Taglist{
let Tlist_Use_Right_Window        = 1     "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close    = 1     "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File           = 1     "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type               ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1     "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow         = 1     "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth                = 32    "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd               ='/usr/bin/ctags' "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
"热键设置，我设置成leader+t来呼出和关闭Taglist
map <leader>t :TlistToggle<CR>
"}

