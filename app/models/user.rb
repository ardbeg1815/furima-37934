class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヴー]+\z/u

  validates :nick_name,  presence: true
  validates :password,   format: { with: VALID_PASSWORD_REGEX }
  validates :last_name,  presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :kana_last,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :kana_first, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_day,  presence: true
end
