# アプリケーション名
  'share_works'

# アプリケーション概要
- 社内向け情報共有システム。コールセンター・全国展開している小売りなど向け。

# URL
- https://share-works-34737.herokuapp.com/

# テスト用アカウント
- メールアドレス：abc@abc.com
- パスワード：123abc

# 利用方法
- 各店舗や、各部署、コールセンター等で、周知や、Q&Aを追加したり共有できる

# 目指した課題解決
- 各店舗やコールセンターで、マニュアルはきちんと準備はされている。
  しかし、マニュアルに記載がないことで、各担当部署へ質問した結果解決できた内容が、
  各店舗または社内での共有ができないことを解決することが目的。

# 要件定義


|機能　　　　　　 |目的　　　　　　 　　　　　　　　  | 詳細　　　　　 　　　　　　　 　　|ストーリー(ユースケース)          　　 　| 
|---------------|-----------------------------|-----------------------------|-----------------------------------------| 
|ＤＢ設計|アプリ作成の全体像を<br>把握する為の<br>必要テーブルの洗いだし。|必要テーブル users/notices/<br>qas/messages|        　　　　　　　　　 |
|ユーザー管理<br>機能|deviceを用いた<br>ユーザー管理機能の<br>必要テーブルの洗いだし。|トップページ真ん中に、<br>ログイン・新規登録機能<br>を、表示させる。|機能を利用するには、<br>新規登録や、<br>ログインが必要になる。|
|お知らせ一覧<br>表示機能|何かあった時に<br>すぐ情報共有ができる為。|一覧には、投稿者、<br>時間、カテゴリ、<br>題名を表示する。| ログインすると、<br>お知らせ一覧が<br>表示される。<br>件名をクリックすると<br>詳細が見れる。|
|お知らせ<br>投稿機能|すぐに情報共有が<br>必要な場合に投稿する。|カテゴリ、題名(件名)、<br>内容を入力してもらう。| 知り得た情報を<br>登録できる。| 
|Q&A一覧<br>投稿機能|マニュアルに記載がない<br>情報を知りたい時に<br>確認できる。|一覧には、投稿者、<br>時間、カテゴリ、<br>題名を表示する。| マニュアルに無い情報が<br>表示される      |
|Ｑ&Ａ<br>投稿機能|マニュアルに記載がなく<br>新たに知り得た情報を<br>登録し共有ができる。|カテゴリ、題名(件名)、<br>質問内容、回答を<br>入力してもらう。 |知り得た情報を<br>登録できる。|
|Ｑ&Ａコメント<br>一覧表示機能|補足情報が<br>あったときに見れる。|一覧には、投稿者、<br>時間、確認内容、<br>回答を表示する。|補足情報があった場合<br>見られる。|  
|Q&Aコメント<br>投稿機能|追加の情報や<br>保続情報があった際に<br>追加できる。|投稿者、時間、確認内容、<br>回答を入力してもらう。|知り得た情報を<br>登録できる。|  


# 実装した機能についての説明
 - ユーザーの新規登録・ログイン機能
 - マニュアルの追記機能

# 実装予定の機能
 - 画像投稿機能
 - 良いね機能 ※閲覧者が参考になった場合、数字をカウントできる機能
 - プルダウンで選択した項目だけ表示される機能

# データベース設計
 - ER図

[![Image from Gyazo](https://i.gyazo.com/8f291b9972eb515741fced1d6f1ab75c.png)](https://gyazo.com/8f291b9972eb515741fced1d6f1ab75c)

# テーブル設計

# usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| affiliation        | string | null: false               |

### Association
- has_many :notices
- has_many :qas
- has_many :messages

# noticesテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| genre_id | integer    | null: false                    |
| subject  | string     | null: false                    |
| notice   | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

# qasテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | -------------------------------|
| genre_id | integer    | null: false                    |
| subject  | string     | null: false                    |
| question | text       | null: false                    |
| answer   | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

# messagesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| subject | text       | null: false                    |
| message | text       | null: false                    |
| qa      | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :notice
- belongs_to :qa

### ローカルでの動作方法
git clone https://github.com/yohikazu-shibuya/share_works.git
<br>ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin20]

