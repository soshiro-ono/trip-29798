
## アプリケーション名
go-to-hyogo

## アプリケーション概要
兵庫県に特化した観光口コミサイトです。

このアプリから地域に根差したローカルな情報を探しやすいようになっています
## URL
https://go-to-hyogo.herokuapp.com/

## テスト用アカウント
メールアドレス mai@com
パスワード mai2525

メールアドレス nisi@com
パスワード nisida24


## ペルソナ
20代から30代の男女

旅行が趣味で数多くの県に旅行した経験がある。

趣味でSNSに旅行の写真を載せることが多い。みんながあまり知っていないような自分だけが知っているという特別に感じられるような場所に行ってみたい。

旅行慣れしたこともありどこの県に行っても観光地が似たり寄ったりに感じられている。その地方にしかないようなローカルな情報が欲しい。

あまり知られてないような観光地を取り上げたサービスがあれば便利だないつも考えています。

## 目指した課題解決
既存のアプリだと有名な観光地ばかりが表示されてしまう課題と仮にローカルな投稿があったとしても埋もれてしまい探しにくいという課題がありました。

また地方に特化した観光アプリやサイトはありましたが企業様が投稿しているため客観的に判断ができないといった課題が存在していました。

そのため地方に特化した口コミ観光アプリを作成することといたしました。口コミ形式にすることで客観性を待たせるようにしています。

また直感で誰でもわかりやすく操作できるように出来る限りシンプルに実装いたしました。検索機能には力を入れておりユーザーの欲しい情報を探し出しやすくしてストレスをかけないように工夫しております。


## 洗い出した要件
### ユーザー管理機能
ログイン、ログアウトなどの機能を実装しユーザーの管理をしやすくしています。

### 画像メッセージ投稿機能
ログインしているユーザーがテキストと画像を投稿できるようにします。

### コメント投稿機能
投稿された画像に対してログインしているユーザがコメントできるようにします。

### 検索機能
キーワード検索により欲しい情報を探しやすくしています。

プルダウン検索によりカテゴリーで絞り込むことも可能です。

予算に合わせて検索、並び替えができるため旅行先を選択しやすくしております。

## 実装予定の機能
### いいね機能
いいねの数によって並び替えができるようにしたい。

## データベース設計
https://gyazo.com/776e84e0ca0642a35007ede0881a9ff4

## 各種機能＆導入技術
ruby  2.6.5

rails  6.0

mysql2  0.5.3

データベース（MySQL）

テスト（Rspec、Capybara、factory_bot）

ユーザー登録＆ログイン(devise)

AWS （S3）

検索（ransack）

ページネーション（kaminari）



# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
|encrypted_password| string | null: false |

### Association
- has_many :spots
- has_many :comments



## spots テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| title  | string | null: false |
| description   | text | null: false |
| city_id   | integer | null: false |
| genre_id   | integer | null: false |
| location_id   | integer | null: false |


### Association
<!-- - has_many :spot_tags
- has_many :tags, through: spot_tags -->
- has_many :comments
- belongs_to :user



<!-- ## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association
- has_many :spot_tags
- has_many :spots, through: spot_tags -->



<!-- ## spot_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| spot   | references | null: false, foreign_key: true |
| tag  | references | null: false, foreign_key: true |

### Association
- belongs_to :spot
- belongs_to :tag -->



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| spot    | references | null: false, foreign_key: true |
| text    | text | null: false |

### Association
- belongs_to :spot
- belongs_to :user


