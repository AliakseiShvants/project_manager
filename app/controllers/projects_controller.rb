class ProjectsController < ApplicationController

  before_action :logged_in_user, only: [:index]

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
  end

  def destroy
    @project = Project.find(params[:id])
    Project.find(params[:id]).destroy
    flash[:success] = "Project #{@project.name} deleted"
    redirect_to projects_url
  end


end
