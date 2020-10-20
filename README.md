# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
|encrypted_password| string | null: false |

### Association
- has_many :areas
- has_many :comments



## areas テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| title  | string | null: false |
| description   | text | null: false |
<!-- もしかするとこの先何か追加するかもアクティブハッシュ？ -->

### Association
- has_many :area_tags
- has_many :tags, through: area_tags
- has_many :comments



## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
<!-- タグ付機能の実装を参照、chat-appの動画ではない -->

### Association
- has_many :area_tags
- has_many :areas, through: area_tags



## area_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| area   | references | null: false, foreign_key: true |
| tag  | references | null: false, foreign_key: true |

### Association
- belongs_to :area
- belongs_to :tag



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| area    | references | null: false, foreign_key: true |
| text    | text | null: false |

### Association
- belongs_to :area
- belongs_to :user





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

