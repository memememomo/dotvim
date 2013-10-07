" vi股間モードをオフ
set nocompatible

" バックスペース設定
set backspace=start,eol,indent

" 前の行までバックスペースが効くようにする
set whichwrap=b,s,[,],<,>,~

" マウスは使わない
set mouse=

" シンタックスハイライト機能
syntax on

" 検索時のハイライトが有効にならないようにする
set nohlsearch

" バックグラウンドが黒の時の色設定
highlight StatusLine ctermfg=black ctermbg=grey
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE

" ステータスラインを表示
set laststatus=2

" ステータスラインに長いパスでファイル名を表示する
set statusline=%F%r%h%=

" /の検索をインクリメンタルにする、大文字小文字を区別しない
set incsearch
set ignorecase

" コマンドラインモードでの保管表示形式を設定
set wildmenu wildmode=list:full


" タブキーで15文字分右へカーソルを移動
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>

" シフト+タブキーで15文字分左へカーソルを移動
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>

" C-nで次のファイルへ編集対象を切り替える
nmap <silent> <C-n> :update<CR>:bn<CR>
imap <silent> <C-n> <ESC>:update<CR>:bn<CR>
vmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
cmap <silent> <C-n> <ESC>:update<CR>:bn<CR>
