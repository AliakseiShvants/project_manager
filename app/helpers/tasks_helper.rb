module TasksHelper

  def get_statuses
     [
        'NEW',
        'IN PROGRESS',
        'DONE'
    ]
  end

  def get_users(users)
    users.collect{|u| [full_name(u), u.id]}
  end

end
