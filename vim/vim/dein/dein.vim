let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh'
        execute '!./installer.sh' s:dein_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Enable native notification
let g:dein#enable_notification = 1

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:dein_toml_dir = '~/.vim/dein'
    call dein#load_toml(s:dein_toml_dir . '/.dein.toml',      {'lazy': 0})
    call dein#load_toml(s:dein_toml_dir . '/.dein_lazy.toml', {'lazy': 1})

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif
