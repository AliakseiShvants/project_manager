module TasksHelper

  def get_statuses
     [
         'NEW',
         'IN PROGRESS',
         'DONE'
    ]
  end

  def full_names(users)
    users.map{|u| full_name(u)}
  end
end
