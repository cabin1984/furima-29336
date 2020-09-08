# README

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

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| -----------| ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name_kanji | string | null: false |
| name_kana  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- belongs_to :purchase

## items テーブル

| Column                  | Type       | Options                        |  
| ----------------------- | -----------| ------------------------------ |
| product_image           | string     | null: false                    |
| product_name            | string     | null: false                    |
| product_description     | text       | null: false                    |
| category                | integer    | null: false                    |
| product_status          | integer    | null: false                    |
| shipping_fee_burden     | integer    | null: false                    |
| shipping_region         | integer    | null: false                    |
| estimated_shipping_date | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Typ     | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefectures   | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :purchase