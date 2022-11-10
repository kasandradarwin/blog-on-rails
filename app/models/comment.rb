# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: { message: 'Comment must be provided' }, length: { minimum: 50, maximum: 200 }
end
