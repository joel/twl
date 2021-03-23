class Post < ApplicationRecord
  validates :title, presence: true, length: {in: 6..80}
  validates :body, presence: true, length: {minimum: 10}
  validates :title, uniqueness: true
end
