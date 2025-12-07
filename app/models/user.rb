class User < ApplicationRecord
  # presence: true => 空文字を不許可
  validates(:name, presence: true, length: { maximum: 50 })
  validates(:email, presence: true, length: { maximum: 255 })
end
