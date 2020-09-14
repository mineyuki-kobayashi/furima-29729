

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| id       | string | null: false |

## Association

- has_many :lists
- has_many :items

## lists テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

## Association

- belongs_to :users
- belongs_to :items
- has_one :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item_image       | string     | null: false                    |
| item_name        | string     | null: false                    |
| item_explanation | string     | null: false                    |
| item_category    | string     | null: false                    |
| item_status      | string     | null: false                    |
| postage          | string     | null: false                    |
| source           | string     | null: false                    |
| schedule         | string     | null: false                    |
| price            | string     | null: false                    |

## Association

- has_many :lists
- belongs_to :users

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | reference  | null: false, foreign_key: true |
| postal      | string     | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| telephone   | string     | null: false                    |

## Association

- belongs_to :lists