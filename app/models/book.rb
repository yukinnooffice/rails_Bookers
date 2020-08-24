class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true, length: { maximum: 200 } do
    validates :title
    validates :body
  end
end

# N
# [相手のモデル名]_id = 相手のインスタンス.id
# user_id = インスタンス.id
# book.user_id = 4