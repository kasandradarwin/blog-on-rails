class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :body, length: {minimum: 50, maximum: 200}
end
