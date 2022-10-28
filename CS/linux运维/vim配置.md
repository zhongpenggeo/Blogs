---
title: vim配置
date: 2021-07-27 10:03:51
categories:
- Linux
---
常用配置
```shell
""------------------------------------------------------------""
"" The Vim configration file for Windows.                     ""
"" Write by Yang Bo, IGG, CUG.                                ""
"" Started : 2012-05-22.                                      ""
""                                                            ""
"" Change Log:                                                ""
"" 2012-05-22: Created the first version 1.0. v1.0 contains   ""
""             i)Basic settings, ii)Fortran language settings,""
""             iii)vim-latex-suite settings, iv)Fortran code  ""
""             writting comments settings.                    ""
""                                                            ""
"" 2012-07-17: Update to version 1.1.                         ""
""             I) delete all fortran code writing cmd, using  ""
""             fortran.vim plugin instead.                    ""
""             II) add some code writing cmd for matlab in    ""
""             matlab.vim plugin.                             ""
""                                                            ""
""------------------------------------------------------------""
""-------------------------------------------------------""
""                Vim-latex-suite settings.
""-------------------------------------------------------""
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
""-------------------------------------------------------""
""                     Fortran settings.
""-------------------------------------------------------""
"
" Set text width and a highlight colum line.
"
set cc=80
"
" Set auto next line beyond text width.
"
set textwidth=80
"
" Set allow CHS auto wrap.
"
set formatoptions+=Mm
"
" Set fortran tab char.
"
let fortran_have_tabs=1
"
" Change the default tab width from 8 to X.
"
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
"
" Allow code folding.
"
let fortran_fold=1
"
" Set folding mode, allow all program, function ... fold.
"
set foldmethod=syntax
"
" Set auto no-flod when opening.
"
set foldlevelstart=99
"
" Display the fold char.
"
set foldcolumn=4
"
" For NERD_commenter plugin, Set C-h to comment and uomment the code.
"
map <c-h> ,c<space>
"
" Auto use NeoComplete.
"
let g:neocomplcache_enable_at_startup = 1
"
" Tags list cmd.
"
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"
" Configure WinManager, Set left colum width and mapping F3 as the shortcut.
"
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
"let g:winManagerWidth=35       
nmap <F3> :WMToggle<cr>
"
" For the close process when multi-file were opened.
"
map fc <Esc>:call CleanClose(1)<CR>
map fq <Esc>:call CleanClose(0)<CR>
function! CleanClose(tosave)
if (a:tosave == 1)
w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
exe "b!".newbufNr
else
bnext
endif
if (bufnr("%") == todelbufNr)
new
endif
exe "bd!".todelbufNr
endfunction
""-------------------------------------------------------""
""                    Basic settings.
""-------------------------------------------------------""
"
" Window behave setting.
"
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
autocmd BufCreate *.* :tabnew "%a"
"
" Set the shortcut key to change insert mode to normal mode.
"
"map jj:<Esc>
"
" Support plugin.
"
filetype plugin on
filetype plugin indent on
"
" Auto check file type.
"
filetype on
"
" Set the chars, for Chinese.
"
set ambiwidth=double 
set fileencoding=gb18030
set fileencodings=utf-8,gb18030,utf-16,big5
"
" Set no backup file.
"
set writebackup
set nobackup
"
" Display line number.
"
set nu!
"
" Set color theme.
"
"colorscheme graywh
"colorscheme desert
"colorscheme desert256 
colorscheme torte
"
" Set syntax highlight.
"
syntax enable
syntax on
"
" Set indent line.
"
set list
set listchars=tab:\|\ ,trail:.
"
" Set fonts.
"
set guifont=Consolas:h14:cANSI
"set encoding=utf8
"
" Set auto change to current direction.
"
set autochdir
"
" Set auto wrap or not.
"
set nowrap
"set wrap
"
" Display the h-scroll-bar
"
"set guioptions+=b
"
" Remove the h-scroll-bar, v-scroll-bar and toolbar.
"
set guioptions-=b
set guioptions-=r
set guioptions-=T
set guioptions-=m
"set guioptions-=L
"set guioptions-=R
"
" set C-F2 to remove the toolbar
"
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar> 
			\set guioptions-=T <Bar> 
			\set guioptions-=m <Bar> 
			\set guioptions-=r <Bar>.
			\set guioptions-=b <Bar>.
			\else <Bar> 
			\set guioptions+=T <Bar> 
			\set guioptions+=m <Bar> 
			\set guioptions+=r <Bar>.
			\set guioptions+=b <Bar>.
			\endif<CR> 
"
" Full screen mode.
"
function! FullScreen()
set guioptions-=T
set guioptions-=m
set guioptions-=b
set guioptions-=l
set guioptions-=L
set guioptions-=R
set guioptions-=r
call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
endfunction
map <F11> <Esc>:call FullScreen()<CR>

" add configuration from windows: 2020-6-11
set mouse=v
"set mouse+=a

" paste without autocomplete braket
set pastetoggle=<F12>
" use pathogen plugin
execute pathogen#infect()

" autocomplete braket and Quotation mark
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
"inoremap { {<CR>}<Esc>O
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=ClosePair()<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

""function CloseBracket()
"" if match(getline(line('.') + 1), '\s*}') < 0
"" return "\<CR>}"
"" else
"" return "\<Esc>j0f}a"
"" endif
""endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf
nmap <C-S> :update<CR>
vmap <C-S> <C-C>:update<CR>
imap <C-S> <C-O>:update<CR>

```