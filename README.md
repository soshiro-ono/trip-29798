# README

## アプリケーション名
trip-29798

## アプリケーション概要
兵庫県に特化した観光口コミサイトです。

## URL

## テスト用アカウント

## 利用方法
口コミ形式で画像とテキストを投稿する。投稿に対してコメント、評価をつけることができます。

## 目指した課題解決
既存のサービスでは有名観光地などしか扱っていない（もしくはたくさんの情報によって埋もれてしまう）ため地域限定の観光案内サービスを作ろうと考えた。地域を絞ることによって投稿された情報が見やすくよりローカルな情報を知ることができます。

## 洗い出した要件
### ユーザー管理機能
ユーザーの管理をしやすくします。

### 画像メッセージ投稿機能
テキストと画像を投稿します。

### コメント投稿機能
投稿された画像にコメントします。

### 検索機能
検索し欲しい情報を見つけやすくします。

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


