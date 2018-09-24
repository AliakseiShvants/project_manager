class ProjectsController < ApplicationController

  before_action :logged_in_user,   only: [:index]
  # before_action :check_for_cancel, only: [:create, :update]

  def index
    @projects = Project.order(start_date: :desc).paginate(:page => params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    project_name = params[:project][:name]
    if @project.save
      flash[:success] = "Project '#{project_name}' successfully created!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project '#{@project.name}' updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    Project.find(params[:id]).destroy
    flash[:success] = "Project #{@project.name} deleted"
    redirect_to projects_url
  end

  private
  def project_params
    params.require(:project).permit(:name, :summary, :start_date, :end_date)
  end

end
