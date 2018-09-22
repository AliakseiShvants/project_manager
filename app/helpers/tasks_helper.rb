module TasksHelper

  def get_statuses
     [
        'NEW',
        'IN PROGRESS',
        'DONE'
    ]
  end

  def full_names(users)
    users.map{|u| "#{u.first_name} #{u.last_name}"}
  end
end
