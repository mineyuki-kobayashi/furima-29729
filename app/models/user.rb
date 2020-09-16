class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true

  VALID_NAME_REGEX =/\A[ァ-ヶー－]+\z/
  validates :first_name_furigana, presence: true,format: { with: VALID_NAME_REGEX }
  validates :last_name_furigana, presence: true,format: { with: VALID_NAME_REGEX }

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

end