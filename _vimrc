set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

"This solves the backspace in insert mode for vsvim
set backspace=indent,eol,start

set grepprg=findstr\ /N

 function MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
 endfunction


vmap <TAB> >gv
vmap <S-TAB> <gv

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set autochdir
set incsearch
set ignorecase
set smartcase
set hls
set cursorline
"set spell

filetype on

nnoremap <esc> :noh<cr><esc>
map L zl
map H zh

let $TMP="C:/VimTemp"
set directory=.,$TMP,$TEMP
set backupdir=C:\\VimTemp
set nu
set nowrap
set co=160
set lines=60
nnoremap <esc> :noh<cr><esc>
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview
set foldcolumn=1
let g:txtfmtTokrange = '&enc == "utf-8" ? "0xE000S" : "180S"' "Disable the use of background colors its just too slow
"let g:txtfmtBgcolormask='00000000'
let g:txtfmtColor3='^g\\%[reen]$,c:Green,g:#08AD00'
let g:txtfmtColor2='^p\\%[each]$,c:Peach,g:#FFB48E'
let g:txtfmtColor5='^r\\%[ed]$,c:Red,g:#DB4343'
let g:txtfmtColor6='^v\\%[iolet]$,c:Violet,g:#E57CF9'
set ft=txtfmt
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
