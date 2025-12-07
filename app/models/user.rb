class User < ApplicationRecord
  # presence: true => 空文字を不許可
  validates(:name, presence: true, length: { maximum: 50 })
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(
    :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true,
  )
  # メアドは大文字小文字を区別すべきではない
  before_save { self.email.downcase! }
  # Userクラスにpassword, password_confirmation属性が強制的に追加される
  # なお、DBのusersテーブルにはpassword_digestカラムが必要
  has_secure_password
  validates(:password, presence: true, length: { minimum: 6 })
end
