" vi互換モードをオフ
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

" エスケープ
imap <C-@> <Esc>

" バックグラウンドが黒の時の色設定
highlight StatusLine ctermfg=gray ctermbg=darkgray
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE

" ステータスラインを表示
set laststatus=2

" ステータスラインに長いパスでファイル名を表示する
set statusline=%F%r%h%=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}(%l:%c)

" /の検索をインクリメンタルにする、大文字小文字を区別しない
set incsearch
set ignorecase

" コマンドラインモードでの保管表示形式を設定
set wildmenu wildmode=list:full

" 文脈によって文字幅が異なる文字を全角文字として固定で認識
set ambiwidth=double

" 文字コード設定
set fileformat=unix
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" カレントカーソル行をハイライト
set cursorline
highlight CursorLine ctermbg=Blue

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle.vimの初期化
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

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

NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler.vim.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'memememomo/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'tpope/vim-endwise.git'
if has('python')
    NeoBundle 'kakkyz81/evervim'
endif
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/vim-javascript'
NeoBundle 'taichouchou2/html5.vim'

" Coffee Script
autocmd BufRead,BufNewFile,BufReadPre *.coffee    set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete_enable_at_startup = 2
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
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
  \ 'javascript'       : $HOME . '/.vim/dict/javascript.dict',
  \ 'coffee'       : $HOME . '/.vim/dict/javascript.dict'
  \ }

" Define keyword.
if !exists('g:neocomplete_keyword_patterns')
let g:neocomplete_keyword_patterns = {}
endif
let g:neocomplete_keyword_patterns['default'] = '\h\w*'

" vim-perl
let g:perl_braceclass_max_indent_level = 1

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

" Quickrun
augroup QuickRunUnitTest
  autocmd!
  autocmd BufWinEnter,BufNewFile *.t set filetype=perl.unit
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config = {}
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "multi:buffer:quickfix",
\       "outputter/buffer/split": ":botright 8sp",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60
\   },
\   "perl.unit": { 'command': 'prove' },
\   "ruby.rspec": { 'command': 'rspec' },
\   "coffee": { 'command': 'coffee', 'exec':['%c -cbp %s']}
\}


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

" コマンド履歴を辿るキーマップ
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" スワップファイルの出力先を変更
set directory=~/.vim/tmp

" バックアップファイルの出力先を変更
set backupdir=~/.vim/tmp


" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" 対となるキーワード間の移動(%の拡張)
runtime macros/matchit.vim

" ペーストトグル
set pastetoggle=<C-E>

" Goに付属のpluginとgocodeを有効にする
if (isdirectory(expand("$GOROOT")))
    filetype off
    filetype plugin indent off
    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
    syntax on
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
    set completeopt=menu,preview
endif

autocmd BufNewFile,BufRead *.go setlocal filetype=go sw=2 expandtab ts=2
autocmd FileType go setlocal noexpandtab list tabstop=2 shiftwidth=2
