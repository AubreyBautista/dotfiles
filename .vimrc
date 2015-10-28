"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set expandtab
syntax enable
set hidden
set nocompatible
"colorscheme zellner

" for files encrypted using ccrypt(1)
augroup CPT
  au!
  " decrypt before reading
  au BufReadPre *.cpt       set bin viminfo= noswapfile
  " decrypted; prepare for editing
  au BufReadPost *.cpt      let $VIMPASS = inputsecret("Password: ")
  au BufReadPost *.cpt      %!ccrypt -cb -E VIMPASS
  au BufReadPost *.cpt      set nobin

  " encrypt
  au BufWritePre *.cpt      set bin
  au BufWritePre *.cpt      %!ccrypt -e -E VIMPASS
  " encrypted; prepare for continuing to edit the file
  au BufWritePost *.cpt     silent undo | set nobin
augroup END

" Powerline settings
set encoding=utf-8
set t_Co=256 
let g:Powerline_symbols = 'fancy'
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

