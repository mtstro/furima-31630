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
| birth         | date    | null: false |

### Association

- has_many :items
- has_many :comments



## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| category  | string     | null: false                    |
| status    | string     | null: false                    |
| ship_cost | string     | null: false                    |
| ship_from | string     | null: false                    |
| ship_date | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments



## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
