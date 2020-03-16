# 使い方
## 初回のみ
ワンコマンドでdotfilesをダウンロードし、ホームディレクトリに設定ファイルをシンボリックリンクとして展開する。
```
bash -c "$(curl -L raw.githubusercontent.com/snyt45/dotfiles/master/etc/install)"
```

一度は通しで下記も行う。
```
make init
make update
make deploy
```

## 運用方法 〜準備〜
* makeコマンドを使うので、makeコマンドが使えるようにしておく。

コマンドが使えるかの確認。
```
which make
```

* 事前にdotfilesのディレクトリに移動しておく必要がある。
```
cd ~/.dotfiles
```

## 運用方法
基本は、更新してデプロイする。

### 初期化(暫定)
暫定運用だが､windowsで試した際にホームディレクトリ/binフォルダがあったため､
デプロイ時にホームディレクトリ/bin/binにシンボリックリンクが展開したことがあった｡
そのため､initコマンドを作り､ホームディレクトリ/binフォルダを削除するコマンドを作った｡

```
make init
```

### 更新
リモートリポジトリからドットファイルの最新情報をダウンロードして、ローカルリポジトリのドットファイルにマージ

(内部的にはgit pullしている)

```
make update
```

### デプロイ
ローカルリポジトリのドットファイルをホームディレクトリ配下に展開
 
(内部的にはシンボリックリンクを作成している)
 
 ```
 make deploy
 ```
 
## その他
### リモートリポジトリの最新化
リモートリポジトリの最新化については、普通にgit pushして行う。

(あくまでMakefileはビルドツールなので、makeコマンドでの最新化はやらない)

### 初回のデプロイ時に特定のドットファイルを除外したい(シンボリックリンクを作成しないようにしたい)
~/.dotfiles/etc/installに追記する。

```sh
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".DS_Store" ] && continue
    ###  ここに上記と同じように追加する  ###

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
```

### makeコマンドでデプロイ時に特定のドットファイルを除外したい(シンボリックリンクを作成しないようにしたい)
~/.dotfiles/Makefileに追記する。

```makefile
# 除外リスト
DOTFILES_EXCEPT := .DS_Store .git .gitmodules .gitignore ### ここにスペース空けて追加 ###
```

### git管理下にファイルを追加したい
現在は、.gitignoreで最初にすべての階層のファイルを無視するようにし、その後管理対象のファイルをホワイリストのように追記するようになっている。

```
############################################################
# all ignore
############################################################
# 最初にすべての階層のファイルを無視
/*
/.**

############################################################
# not ignore
############################################################
# .gitignoreは上から解釈されていくので
# 管理対象のファイルをホワイトリストのように追記
!.gitignore
!/etc
!Makefile
```

not ignoreに管理対象としたいものを追記していく。
```
# ファイルを管理対象とする
!.gitigonre 
# ディレクトリを管理対象とする
!/etc       
# ディレクトリは管理対象とするが、中身はいらない場合
!/.zfunc/    # ディレクトリの中身全てを管理対象として、
/.zfunc/**   # ディレクトリの中身を管理対象外とする
```

### hyper.jsのクロスプラットフォーム対応
hyper.jsのデフォルトシェルの設定のみ、WindowsとMacで異なる。

下記を参考にシェルスクリプトを使って対応。

`make deploy`時に、hyper.jsが生成されるようにしている。

[Hyperターミナルの設定ファイルをWindows/Macで共通化してGit管理する \- Qiita](https://qiita.com/suzuki_sh/items/45ad7e98280539ad374d)

# 参考
・makefileの構成やdotfilesのディレクトリ構成等ほとんど参考にさせていただきました。

[最強の dotfiles 駆動開発と GitHub で管理する運用方法 \- Qiita](https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2)

[優れた dotfiles を設計して、最速で環境構築する話 \- Qiita](https://qiita.com/b4b4r07/items/24872cdcbec964ce2178)


・.gitignoreと.gitignore_globalの導入について参考にさせていただきました。

[ようこそdotfilesの世界へ \- Qiita](https://qiita.com/yutakatay/items/c6c7584d9795799ee164#dotfiles%E7%94%A8%E3%81%AEgitignore%E3%81%AE%E8%A8%AD%E5%AE%9A)
