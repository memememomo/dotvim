# 導入手順

## Luaのインストール

if_luaを使用するためにLuaをインストールする。

    tar xvzf http://www.lua.org/ftp/lua-5.2.3.tar.gz
    cd lua-5.2.3
    make linux MYLIBS=-ltermcap
    sudo make install

Vimのインストール時にlua.hを指定するので、コピーする。

    sudo cp src/lua.h /usr/include

## Pythonのインストール

if_pythonを使用するためにPythonをインストールする。

    wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
    tar xvzf Python-2.7.6.tgz
    cd Python-2.7.6
    ./configure
    make
    make install

## Markdownのインストール

    http://peak.telecommunity.com/dist/ez_setup.py
    sudo python ez_setup.py
    sudo python ez_setup.py -U setuptools
    wget http://pypi.python.org/packages/source/M/Markdown/Markdown-2.3.tar.gz
    tar xvzf Markdown-2.3.tar.gz
    cd markdown-2.3/
    sudo python setup.py install

## EvernoteのAPIトークンを取得する

以下のURLで取得する。

    https://www.evernote.com/api/DeveloperToken.action

以下の変数にtokenを設定する。

    let g:evervim_devtoken=''

## Vimのインストール

Luaの指定を含めてコンパイルをする。

    tar xvjf vim-7.4.tar.bz2
    cd vim-7.4
    ./configure --enable-luainterp  --with-features=huge --enable-multibyte --enable-fail-if-missing --enable-pythoninterp
    make
    sudo make install

## githubの自分のアカウントに鍵認証登録を行う

NeoBundleのインストール時にgithubにアクセスするため。

    ssh-keygen
    cat ~/.ssh/id_rsa.pub

## NeoBundleのインストールと実行

    mkdir -p  ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## スワップファイルとバックアップファイルの出力ディレクトリの作成

    mkdir -p ~/.vim/tmp


## .vimrcをclone

    git clone git@github.com:memememomo/dotvim.git
    cd dotvim
    ln -s `pwd`/.vimrc ~/.vimrc
    ln -s `pwd`/dict ~/.vim/dict


## スニペットファイルをダウンロード

    git clone git@github.com:memememomo/vim-snippets.git
    cd vim-snippets
    ln -s `pwd` ~/.vim/bundle/vim-snippets

## Neobundleinstallの実行

vimを立ち上げて「NeoBundleInstall」を実行する
