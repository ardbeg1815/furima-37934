# DB設計

## users table
| column             | type   | option                     |
|--------------------|--------|----------------------------|
| nick_name          | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| first_name         | string | null: false                |
| last_name          | string | null: false                |
| kana_first         | string | null: false                |
| kana_last          | string | null: false                |
| birth_day          | date   | null: false                |

### Association
* has_many :items
* ha_one   :order

## items table
| column          | type      | option                        |
|-----------------|-----------|-------------------------------|
| item_name       | string    | null: false                   |
| category        | string    | null: false                   |
| price           | integer   | null: false                   |
| seller_name     | string    | null: false                   |
| delivery_charge | string    | null: false                   |
| area            | string    | null: false                   |
| delivery_date   | string    | null: false                   |
| comment         | text      | null: false                   |
| user_id         | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :orders

## orders_table
| column         | type      | option                         |
|----------------|-----------|--------------------------------|
| post_code      | string    | null: false                    |
| prefectures    | string    | null: false                    |
| municipalities | string    | null: false                    |
| address        | string    | null: false                    |
| building       | string    | null: false                    |
| phone_number   | integer   | null: false                    |
| user_id        | reference | null: false, foreign_key: true |
| item_id        | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item