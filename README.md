* 導入手順

** githubの自分のアカウントに鍵認証登録を行う

NeoBundleのインストール時にgithubにアクセスするため。


** スワップファイルとバックアップファイルの出力ディレクトリの作成

  mkdir ~/.vim/tmp


** .vimrcをclone

  git clone git@github.com:memememomo/dotvim.git
  ln -s /path/to/dotvim/.vimrc ~/.vimrc
  ln -s /path/to/dotvim/dict ~/.vim/dict


** スニペットファイルをダウンロード

  git clone git@github.com:memememomo/vim-snippets.git
  ln -s /path/to/vim-snippets ~/.vim/bundle/vim-snippets


** NeoBundleのインストールと実行

  mkdir -p  ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

vimを立ち上げて「NeoBundleInstall」を実行する
