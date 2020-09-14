

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

## Association

- has_one :list
- has_many :items

## lists テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_name        | string     | null: false                    |
| item_explanation | text       | null: false                    |
| item_category    | integer    | null: false                    |
| item_status      | integer    | null: false                    |
| postage          | integer    | null: false                    |
| source           | integer    | null: false                    |
| schedule         | integer    | null: false                    |
| price            | integer    | null: false                    |

## Association

- has_many :lists
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| list        | reference  | null: false, foreign_key: true |
| postal      | string     | null: false                    |
| prefectures | integer    | null: false                    |
| city        | string     |                                |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| telephone   | string     | null: false                    |

## Association

- belongs_to :list