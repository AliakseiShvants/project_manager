module ProjectsHelper

  def current_project?(project)
    project == current_project
  end

  def date_time_format?
    "%d/%m/%Y %H:%M"
  end

  def check_end_date(datetime)
    datetime.strftime(date_time_format?) unless datetime.nil?
    (DateTime.now + 1.year).strftime(date_time_format?)
  end

end
