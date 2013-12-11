# 導入手順

## Luaのインストール

if_luaを使用するためにLuaをインストールする。

    tar xvzf http://www.lua.org/ftp/lua-5.2.3.tar.gz
    cd lua-5.2.3
    make linux
    sudo make install

Vimのインストール時にlua.hを指定するので、コピーする。

    sudo cp src/lua.h /usr/include

## Vimのインストール

Luaの指定を含めてコンパイルをする。

    tar xvjf vim-7.4.tar.bz2
    cd vim-7.4
    ./configure --enable-luainterp  --with-features=huge --enable-multibyte --enable-fail-if-missing
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
    ln -s `pwd`/dotvim/.vimrc ~/.vimrc
    ln -s `pwd`/dotvim/dict ~/.vim/dict


## スニペットファイルをダウンロード

    git clone git@github.com:memememomo/vim-snippets.git
    ln -s `pwd`/vim-snippets ~/.vim/bundle/vim-snippets

## Neobundleinstallの実行

vimを立ち上げて「NeoBundleInstall」を実行する
