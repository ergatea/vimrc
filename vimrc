call pathogen#infect()

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion 
syntax on

" color
color peaksea

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

" search operations
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set history=1000
set backspace=indent,eol,start                                    " More powerful backspacing

" display settings
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set wrap                                                        " dont wrap lines
set scrolloff=2                                                   " 2 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
"set relativenumber
"set ruler                                                         " show cursor position in status bar
"set showmode                                                      " show mode in status bar (insert/replace/...)

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace & 
set shiftwidth=4    " indent width
"set textwidth=79
set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1


" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" snip
let g:srips_author = "Xiaoping Tang"
" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

let g:CommandTCancelMap=['<ESC>','<C-c>']


" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Tagbar
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

set completeopt-=preview

" 自动补全配置
" neocomplcache 
"
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Keybindings for plugin toggle
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
" 打开文件定位窗口
nnoremap <Leader>r :CommandT<CR>
nnoremap <leader>a :Ack


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" eggcache vim
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa


" GUI VIM
if has("gui_running")
    set go=aAce                 " 去掉难看的工具栏和滑动条
    "set transparency=20         " 透明背景
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40

    if has("gui_macvim")
        set guifont=Monaco:h14
    elseif has("gui_gtk")
        set guifont=Monospace\ 14
    else
        set guifont=Monaco:h14
    endif

    if has("gui_macvim")
        " code
        nmap <D-j> mz:m+<cr>`z
        nmap <D-k> mz:m-2<cr>`z
        vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
        vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
 
        " disable default menu hot key 
        macmenu &File.New\ Window key=<nop>
        macmenu &File.Close key=<nop>

        " remap cmd + w to close tab
        map <D-w> :tabclose<CR>
        map <D-n> :tabnew<CR>
        " map cmd + enter to switch to full screen
        map <D-Enter> :set invfu<CR>
 
        for i in range(1,9)
            exec "nnoremap <D-".i."> ".i."gt"
        endfor
    endif
endif
