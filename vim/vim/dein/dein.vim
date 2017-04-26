" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Pyton3 support
let g:pyton3_host_prog = '~/.pyenv/shims/python3'

" Enable native notification
let g:dein#enable_notification = 1

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:dein_toml_dir = '~/.vim/dein'
    call dein#load_toml(s:dein_toml_dir . '/.dein.toml',      {'lazy': 0})
    call dein#load_toml(s:dein_toml_dir . '/.dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。

if dein#check_install()
    call dein#install()
endif
