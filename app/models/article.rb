class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :birthdate, presence: true

  def get_resources
    JSON.parse(self.resources)
  end
end
