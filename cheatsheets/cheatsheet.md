# cheatsheet
## default



## custom

### vim

#### config file

| Command | Info                 | mode | star |
| ------- | -------------------- | ---- | ---- |
| ¥ev     | .vimrc を開く        |      | ★★★  |
| ¥et     | .tmux.conf を開く    |      | ★★☆  |
| ¥eb     | .bashrc を開く       |      | ★☆☆  |
| ¥ep     | .bash_profile を開く |      | ★☆☆  |


#### display

| Command | Info           | mode | star |
| ------- | -------------- | ---- | ---- |
| EscEsc  | ハイライト解除 |      | ★★★  |

#### window

| Command | Info     | mode | star |
| ------- | -------- | ---- | ---- |
| sh      | 左に移動 |      | ★★★  |
| sj      | 下に移動 |      | ★★★  |
| sk      | 上に移動 |      | ★★★  |
| sl      | 右に移動 |      | ★★★  |
| ss      | 水平分割 |      | ★★☆  |
| sv      | 垂直分割 |      | ★★☆  |


#### buffer

| Command | Info                         | mode | star |
| ------- | ---------------------------- | ---- | ---- |
| \_o     | カレントバッファ以外を閉じる |      | ★☆☆  |
| C-j     | 次のバッファ                 |      | ★☆☆  |
| C-k     | 前のバッファ                 |      | ★☆☆  |

#### tab

| Command | Info           | mode | star |
| ------- | -------------- | ---- | ---- |
| C-l     | 次のタブ       |      | ★★☆  |
| C-h     | 前のタブ       |      | ★★☆  |
| tn      | 新規タブ       |      | ★★☆  |
| tx      | タブを閉じる   |      | ★★☆  |
| tl      | タブを左に移動 |      | ★☆☆  |
| th      | タブを右に移動 |      | ★☆☆  |

#### mode change

| Command | Info                 | mode   | star |
| ------- | -------------------- | ------ | ---- |
| jj      | insert mode を抜ける | insert | ★★★  |
| っ j    | insert mode を抜ける | insert | ★☆☆  |

#### winresizer

| Command | Info                     | mode | star |
| ------- | ------------------------ | ---- | ---- |
| C-e + h | ウィンドウを左にリサイズ |      | ★★☆  |
| C-e + j | ウィンドウを下にリサイズ |      | ★★☆  |
| C-e + k | ウィンドウを上にリサイズ |      | ★★☆  |
| C-e + l | ウィンドウを右にリサイズ |      | ★★☆  |

#### vimfiler

| Command | Info                                 | mode | star |
| ------- | ------------------------------------ | ---- | ---- |
| sf      | カレントバッファのディレクトリを開く |      | ★★★  |
| sF      | 作業ディレクトリを IDE 風に開く      |      | ★★★  |


#### unite

| Command | Info                             | mode | star |
| ------- | -------------------------------- | ---- | ---- |
| ,/      | ファイル内の grep 検索           |      | ★★☆  |
| ,g      | grep 検索                        |      | ★★☆  |
| ,dg     | ディレクトリを指定して grep 検索 |      | ★☆☆  |
| ,cg     | カーソル位置の単語を grep 検索   |      | ★☆☆  |
| ,r      | grep 検索結果の再呼出            |      | ★☆☆  |
| ,sb     | バッファ一覧を開く               |      | ★☆☆  |


#### ctrlp

| Command | Info         | mode | star |
| ------- | ------------ | ---- | ---- |
| C-p     | ファイル検索 |      | ★★☆  |

#### fugitive

| Command | Info                 | mode | star |
| ------- | -------------------- | ---- | ---- |
| \_gb    | 過去の変更をたどる   |      | ★☆☆  |
| \_gd    | 差分を表示           |      | ★★☆  |
| \_gs    | ステータス画面を開く |      | ★★☆  |

#### Previm

| Command | Info                 | mode | star |
| ------- | -------------------- | ---- | ---- |
| _p o   | ブラウザでプレビュー |      | ★★☆  |
| _p r   | ブラウザリロード     |      | ★★☆  |


#### maketable

| Command | Info                                   | mode   | star |
| ------- | -------------------------------------- | ------ | ---- |
| \_t     | 最初の行をテーブルのヘッダーとして作成 | visual | ★★☆  |


#### prettier

| Command | Info       | mode   | star |
| ------- | ---------- | ------ | ---- |
| pre     | コード整形 | visual | ★★☆  |

### tmux

|prefix|C-t|
|------|---|

#### pain

| Command      | Info             | star |
| ------------ | ---------------- | ---- |
| prefix + h   | 左に移動         | ★★★  |
| prefix + j   | 下に移動         | ★★★  |
| prefix + k   | 上に移動         | ★★★  |
| prefix + l   | 右に移動         | ★★★  |
| prefix + H   | 左にリサイズ     | ★★☆  |
| prefix + J   | 下にリサイズ     | ★★☆  |
| prefix + K   | 上にリサイズ     | ★★☆  |
| prefix + L   | 右にリサイズ     | ★★☆  |
| prefix + v   | 垂直分割         | ★★☆  |
| prefix + s   | 水平分割         | ★★☆  |

#### other

| Command    | Info                 | star |
| ---------- | -------------------- | ---- |
| prefix + r | 設定ファイルリロード | ★★☆  |
| prefix + e | 並列実行(トグル)     | ★★☆  |
| prefix + m | マウスモード(トグル) | ★★☆  |

### command

| Command | Info                     |
| ------- | ------------------------ |
| che     | チートシートを開く       |
| chep    | チートシートをプレビュー |
| ide     | tmux で IDE 風に開く     |

### dotfile

| Command     | Info     |
| ----------- | -------- |
| make update | 更新     |
| make deploy | デプロイ |

