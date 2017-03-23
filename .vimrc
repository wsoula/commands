"Turn syntax highlighting on"
syntax on
"turn on auto-indenting at two spaces, ctrl+t in inset mode, inserts \t"
:set ai sw=2
"make tabs be spaces"
set expandtab
"remove trailing white space: http://vim.wikia.com/wiki/Remove_unwanted_spaces"
autocmd BufWritePre * %s/\s\+$//e
"editorconfig"
filetype plugin on
"remove trailing white space:
"http://vim.wikia.com/wiki/Remove_unwanted_spaces"
autocmd BufWritePre * %s/\s\+$//e
"pathogen.vim"
execute pathogen#infect()
