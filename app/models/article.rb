class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :birthdate, presence: true

  def get_resources
    JSON.parse(self.resources)
  end

  def get_duties
    #example [{"title": "Президент", "start_date" : "1989", "end_date" : "1995", "predecessor" : "Ленин", "successor" : "Сталин"
    # }]
    JSON.parse(self.duties)
  end
end
