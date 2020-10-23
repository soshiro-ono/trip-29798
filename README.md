# README

## アプリケーション名
trip-29798

## アプリケーション概要
兵庫県に特化した観光口コミサイトです。
地域を絞った分、他のwebサービスでは載っていないローカルな情報を知ることができます。
## URL

## テスト用アカウント

## 利用方法
ログインしたユーザーは画像とテキストを投稿することができます。また他人の投稿に対してコメント、評価をつけることができます。また検索機能が実装されているため自分の興味のあるワードを検索し調べることも可能です。兵庫に旅行する際はこのアプリケーションを使うことで他の観光サイトには載っていないようなスポットをまわることができます。


## 目指した課題解決
既存のサービスでは有名観光地などしか扱っていない（もしくはたくさんの情報によって埋もれてしまう）ため地域限定の観光案内サービスを作ろうと考えました。地域を絞ることによって投稿された情報が見やすくなり、よりローカルな情報を知ることができます。

## 洗い出した要件
### ユーザー管理機能
ログイン、ログアウトなどの機能を実装しユーザーの管理をしやすくしています。

### 画像メッセージ投稿機能
ログインしているユーザーがテキストと画像を投稿できるようにします。

### コメント投稿機能
投稿された画像に対してログインしているユーザがコメントできるようにします。

### 検索機能
ユーザーが検索し欲しい情報を探しやすくすることができます。

## 実装した機能についてのGIFと説明

## 実装予定の機能
### タグ付機能
タグをつけることによってより情報を探しやすくしております。

## データベース設計
https://gyazo.com/776e84e0ca0642a35007ede0881a9ff4

## ローカルでの動作方法

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
<!-- もしかするとこの先何か追加するかもアクティブハッシュ？ -->

### Association
- has_many :spot_tags
- has_many :tags, through: spot_tags
- has_many :comments



## tags テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
<!-- タグ付機能の実装を参照、chat-appの動画ではない -->

### Association
- has_many :spot_tags
- has_many :spots, through: spot_tags



## spot_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| spot   | references | null: false, foreign_key: true |
| tag  | references | null: false, foreign_key: true |

### Association
- belongs_to :spot
- belongs_to :tag



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| spot    | references | null: false, foreign_key: true |
| text    | text | null: false |

### Association
- belongs_to :spot
- belongs_to :user


