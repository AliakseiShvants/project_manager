class ProjectsController < ApplicationController

  before_action :logged_in_user,   only: [:index]
  # before_action :check_for_cancel, only: [:create, :update]

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
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
    params.require(:project).permit(:summary, :end_date)
  end

  # def check_for_cancel
  #   redirect_to projects_url if params[:cancel]
  # end

end
