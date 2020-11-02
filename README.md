# README


# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| fam_name      | string  | null: false |
| fir_name      | string  | null: false |
| fam_name_read | string  | null: false |
| fir_name_read | string  | null: false |
| birthday      | date    | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| about     | text       | null: false                    |
| category  | string     | null: false                    |
| status    | string     | null: false                    |
| ship_cost | string     | null: false                    |
| ship_from | string     | null: false                    |
| ship_date | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| card_num  | integer    | null: false                    |
| limit_m   | integer    | null: false                    |
| limit_y   | integer    | null: false                    |
| security  | integer    | null: false                    |
| post_code | string     | null: false                    |
| region    | string     | null: false                    |
| city      | string     | null: false                    |
| address   | string     | null: false                    |
| phone_num | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
