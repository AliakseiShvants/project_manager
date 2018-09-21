class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  self.per_page = 10

  validates :name,       presence: true, length: { maximum: 100}
  validates :summary,    presence: true, length: { maximum: 1000}
  validates :start_date, presence: true

end
