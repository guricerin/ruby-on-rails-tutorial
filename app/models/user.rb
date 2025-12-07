class User < ApplicationRecord
  validates(:name, presence: true) # 空文字を不許可
  validates(:email, presence: true)
end
