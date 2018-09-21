module ProjectsHelper

  def current_project?(project)
    project == current_project
  end

  def date_time_format?
    "%d/%m/%Y %H:%M"
  end


end
