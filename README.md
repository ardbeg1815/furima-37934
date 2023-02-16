# DB設計

## users table
| column             | type   | option                     |
|--------------------|--------|----------------------------|
| nick_name          | string | null: false                | <!-- ニックネーム -->
| email              | string | null: false , unique: true | <!-- メールアドレス -->
| encrypted_password | string | null: false                | <!-- パスワード(暗号化) -->
| last_name          | string | null: false                | <!-- 名字 -->
| first_name         | string | null: false                | <!-- 名前 -->
| kana_last          | string | null: false                | <!-- 苗字(カタカナ) -->
| kana_first         | string | null: false                | <!-- 名前(カタカナ) -->
| birth_day          | date   | null: false                | <!-- 生年月日 -->

### Association
* has_many :items
* has_many :orders

## items table
| column             | type       | option                         |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    | <!-- 商品名 -->
| description        | text       | null: false                    | <!-- 商品の説明 -->
| category_id        | integer    | null: false                    | <!-- カテゴリー -->
| condition_id       | integer    | null: false                    | <!-- 商品の状態 -->
| delivery_charge_id | integer    | null: false                    | <!-- 配送料の負担 -->
| prefecture_id      | integer    | null: false                    | <!-- 発送元の地域 -->
| delivery_date_id   | integer    | null: false                    | <!-- 発送までの日数 -->
| price              | integer    | null: false                    | <!-- 値　段 -->
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order

## orders table
| column  | type       | option                         |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :address
- belongs_to :item

## address table
| column         | type       | option                         |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    | <!-- 郵便番号 -->
| prefecture_id  | integer    | null: false                    | <!-- 都道府県 -->
| municipalities | string     | null: false                    | <!-- 市町村区 -->
| address        | string     | null: false                    | <!-- 番　地 -->
| building       | string     |                                | <!-- 建物名 -->
| phone_number   | string     | null: false                    | <!-- 電話番号 -->
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order