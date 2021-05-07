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
"ale"
"let g:ale_python_pylint_executable = "/usr/local/bin/pylint"
let g:ale_lint_on_text_changed = 'always'
"let g:ale_lint_on_insert_leave = 1
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_pylint_options = '--max-line-length=120'
"pathogen.vim"
execute pathogen#infect()
"syntastic"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_pylint_post_args="--max-line-length=120"
