class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :birthdate, presence: true

end
