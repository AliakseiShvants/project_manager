class Task < ApplicationRecord

  belongs_to :project
  belongs_to :user

  # STATUSES = {
  #     NEW:         'NEW',
  #     IN_PROGRESS: 'IN PROGRESS',
  #     DONE:        'DONE'
  # }

  validates :title,       presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status,      presence: true


end
