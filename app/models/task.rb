class Task < ApplicationRecord

  belongs_to :project
  belongs_to :user

  validates :title,       presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :status,      presence: true
  validates :project_id,     presence: true


end
