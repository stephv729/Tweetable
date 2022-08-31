class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: true

  # Validations
  validates :body, length: { minimum: 1, maximum: 140 }
end
