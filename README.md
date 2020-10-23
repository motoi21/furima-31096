## users テーブル

|Column                 |Type     |Options                    |
|-----------------------|---------|---------------------------|
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique; true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| kana_last_name        | string  | null: false               |
| kana_first_name       | string  | null: false               |
| birth_date            | integer | null: false               |


### Association
- has_many :items
- has_many :purchases


## items テーブル
|Column              |Type        |Options                       |
|--------------------|------------|------------------------------|
| image              |            | ActiveStorageを使用           |
| name               | text       | null: false                  |
| description        | text       | null: false                  |
| category_id        | integer    | null: false, ActiveHashを使用 |
| status_id          | integer    | null: false, ActiveHashを使用 |
| shipping_charge_id | integer    | null: false, ActiveHashを使用 |
| prefecture_id      | integer    | null: false, ActiveHashを使用 |
| days_to_ship_id    | integer    | null: false, ActiveHashを使用 |
| price              | integer    | null: false,                 |
| user               | references | foreign_key :true            |

## Association
- belongs_to :user
- has_one :purchase

- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_ship

## purchases テーブル

|Column|Type        |Options                    |
|------|------------|---------------------------|
| user | references | foreign_key :true         |
| item | references | foreign_key :true         |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

|Column         |Type        |Options                       |
|---------------|------------|------------------------------|
| postal_code   | integer    | null: false                  |
| prefecture_id | integer    | null: false, ActiveHashを使用 |
| city          | string     | null:false                   |
| address       | string     | null: false                  |
| tel           | integer    | null: false                  |
| purchase      | references | foreign_key: true            |


### Association
- belongs_to purchases

- belongs_to_active_hash :prefecture