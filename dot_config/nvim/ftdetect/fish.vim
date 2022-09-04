" This file is copied from https://github.com/dag/vim-fish

autocmd BufRead,BufNewFile *.fish setfiletype fish

" Detect fish scripts by the shebang line.
autocmd BufRead *
            \ if getline(1) =~# '\v^#!%(\f*/|/usr/bin/env\s*<)fish>' |
            \     setlocal filetype=fish |
            \ endif
