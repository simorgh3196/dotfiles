set encoding=utf8
scriptencoding utf-8

" --- 文字コード ---
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,enc-jp,cp932 " 読み込み時の文字コードの自動判別, 左優先
set fileformats=unix,dos,mac " 改行コードの自動判別, 左優先
set ambiwidth=double " □や⚪︎文字が崩れる問題を解決


" --- タブ・インデント ---
set expandtab " タブ入力を複数の空白入力に置き換え
set tabstop=4 " 画面上でタブ文字が占める幅
set autoindent " 開業時に前の行のインデントを継続
set smartindent " 開業時に前の行の構文をチェックして次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
filetype plugin on " ftpluginを有効にする


" --- 文字列検索 ---
set incsearch " インクリメンタルサーチ
set smartcase " 大文字を含んでいたら、大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" 検索時の選択を外す
nnoremap <ESC><ESC> :noh<CR>


" --- 見た目 ---
set t_Co=256
syntax on
set cursorline " 現在の行を強調表示
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " コマンドを最下部に表示
set ruler " 右下に行・列番号を表示
set number " show line num


" --- Color Scheme ---
set t_ut=
set termguicolors
colorscheme onedark


" --- コマンド補完 ---
set wildmenu " 補完候補をリスト表示
set history=5000 " 保存するコマンドの数


" --- マウスの有効化 ---
if has('mouse')
    set mouse=a
endif


" --- 最後のカーソル位置を復元する ---
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif


" --- Visualモードの時に*で選択位置のコードを検索するようにする ---
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction


" --- 不可視文字の表示 ---
set list " 不可視文字を表示
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%,eol:↲


" --- 一時ファイルの保存場所の設定 ---
set directory=~/.cache/vim
set backupdir=~/.cache/vim


" --- neovim用の設定 ---
if has('nvim')
    tnoremap <ESC> <C-\><C-n>
endif


" --- その他 ---
set title      " ファイル名表示
set showmatch  " 対応括弧を強調
set matchpairs& matchpairs+=<:> " 対応括弧に<と>を追加
set nohlsearch
set infercase " 補完の際の大文字小文字の区別しない
set wrapscan
set hlsearch   " 検索語を強調
set autoread " 編集中のファイルが変更されたら自動で読み直す

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has('nvim')
    nmap <BS> <C-W>h
endif

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" xキーでヤンクの内容を上書きしない
noremap x "_x

" Yの動作をDやCと同じにする
map Y y$

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

"カーソルを表示行で移動する。
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

inoremap <C-p> <Up>
inoremap <C-n> <Down>

