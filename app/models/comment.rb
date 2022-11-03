class Comment < ApplicationRecord
    belongs_to :post
    validates :body, length: {minimum: 50, maximum: 200}

end
