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

" 検索時のハイライトを無効化にする
set hlsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

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

" 文字コード設定
set fileformat=unix
set fileencoding=utf-8

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

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle.vimの初期化
call neobundle#rc(expand('~/.vim/bundle'))

" neobundle.vimを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
" NeoBundle 'プラグイン名'

" 読み込んだプラグインも含め、ファイルタイプの検出、
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" NeoBundleLazyコマンドを使用し、
" :Vinariseコマンド実行時に読み込む
NeoBundleLazy 'Shougo/vinarise', {
            \ 'autoload': {
            \     'commands': 'Vinarise',
            \ }}

" NeoBundleコマンドを使用し、
" :Vinariseコマンド実行時に読み込む
NeoBundle 'Shougo/vinarise', {
             \ 'lazy': 1,
             \ 'autoload': {
             \     'commands': 'Vinarise',
             \ }}

" Unite
NeoBundle 'Shougo/unite.vim', {'lazy': 1,
             \ 'depends': [
             \             'Shougo/vimshell',
             \            ],
             \ 'autoload': {
             \      'commands': [{'name': 'Unite',
             \                    'complete': 'customlist,unite#complete_source'},
             \                    'UniteWithBufferDir',  
             \                    'UniteWithCurrentDir',  
             \                    'UniteWithCursorWord',  
             \                    'UniteWithInput'],  
             \ }}                     

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ud :<C-u>Unite file<CR>

" Neocomplete
NeoBundle 'Shougo/neocomplete', {
            \ 'autoload': {
                        \     'insert': 1,
            \ }}
let g:neocomplete#enable_at_startup = 1

NeoBundle 'git@github.com:Shougo/neosnippet'
NeoBundle 'git@github.com:Shougo/vimfiler.vim.git'
NeoBundle 'git@github.com:vim-perl/vim-perl'
NeoBundle 'git@github.com:hotchpotch/perldoc-vim'
NeoBundle 'git@github.com:szw/vim-tags'


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete_enable_at_startup = 1
" Use underbar completion.
let g:neocomplete_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete_min_syntax_length = 3
let g:neocomplete_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplete_enable_smart_case = 1
" Use camel case completion.
let g:neocomplete_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplete_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
  \ }

" Define keyword.
if !exists('g:neocomplete_keyword_patterns')
let g:neocomplete_keyword_patterns = {}
endif
let g:neocomplete_keyword_patterns['default'] = '\h\w*'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" for snippets
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Perl file
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl

" HTML file
autocmd BufNewFile,BufRead *.html.tt set filetype=html
autocmd BufNewFile,BufRead *.tmpl set filetype=html

" 不可視文字を表示(コピペするとこれらの記号が含まれてしまう...)
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" Default Indent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Lang Indent
augroup vimrc
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" tagsジャンプの時に複数あるときは一覧表示
nnoremap <C-]> g<C-]> 

" スワップファイルの出力先を変更
set directory=~/.vim/tmp

" バックアップファイルの出力先を変更
set backupdir=~/.vim/tmp
