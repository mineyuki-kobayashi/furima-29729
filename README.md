

# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_furigana | string | null: false |
| last_name_furigana  | string | null: false |
| birthday            | date   | null: false |
| email               | string | null: false |
| password            | string | null: false |
| nickname            | string | null: false |

## Association

- has_many :lists
- has_many :items

## lists テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :purchase

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| source_id        | integer    | null: false                    |
| schedule_id      | integer    | null: false                    |
| price_id         | integer    | null: false                    |

## Association

- has_one :list
- belongs_to :user

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| list           | reference  | null: false, foreign_key: true |
| postal         | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |

## Association

- belongs_to :list