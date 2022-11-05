class Comment < ApplicationRecord
    belongs_to :post
    validates :body, presence: { message: "Comment must be provided" }, length: { minimum: 50, maximum: 200 }

end
