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
  before_save { self.email = email.downcase }
end
