set expandtab       " tab文字を空白文字にする。
set tabstop=4       " tab文字1つを、何個の空白にするか
set softtabstop=4   " 入力したtab文字の空白の個数
set shiftwidth=4    " 自動インデントの際に、何個の空白にするか
set autoindent
set smartindent

augroup fileTypeSetting
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb,*.js,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.hs setlocal tabstop=2 softtabstop=2 shiftwidth=2 filetype=haskell
    autocmd BufNewFile,BufRead *.md setlocal tabstop=2 softtabstop=2 shiftwidth=2 filetype=markdown
    autocmd BufNewFile,BufRead Rakefile, Podfile, *.podspec setlocal tabstop=2 softtabstop=2 shiftwidth=2 filetype=ruby
augroup END
