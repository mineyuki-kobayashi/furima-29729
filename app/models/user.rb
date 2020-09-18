class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true do

  # ニックネームが必須であること
  validates :nickname

  # 生年月日が必須であること
  validates :birthday

  # メールアドレスが必須であること,メールアドレスが一意性であること,メールアドレスは@を含む必要があること
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  # ユーザー本名が、名字と名前がそれぞれ必須であること,ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, format: { with: VALID_NAME_REGEX }
  validates :last_name, format: { with: VALID_NAME_REGEX}

  # ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること,ユーザー本名のフリガナは全角（カタカナ）で入力させること
  VALID_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_furigana, format: { with: VALID_FURIGANA_REGEX }
  validates :last_name_furigana, format: { with: VALID_FURIGANA_REGEX }
  
  # パスワードが必須であること,パスワードは6文字以上であること,パスワードは半角英数字混合であること
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
 end
end
