class Project < ApplicationRecord
  has_many :tasks
  self.per_page = 10

end
