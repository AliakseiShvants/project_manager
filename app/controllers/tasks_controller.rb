class TasksController < ApplicationController

  before_action :logged_in_user,      only: [:index]
  before_action :correct_task_user,   only: [:edit, :update]
  before_action :admin_user,          only: [:destroy]

  def index
    @tasks = Task.paginate(:page => params[:page])
    @title = "All tasks"
  end

  def show
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
  end

  def new
    @task = Task.new
    @users = User.all_except_admin
  end

  def edit
    @task = Task.find(params[:id])
    # @user = User.find_by(id: @task.user_id)
    @users = User.all_except_admin
    # @users.include?(@user)
  end

  def create
    @project = Project.find_by(id: params[:task][:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task '#{@task.title}' created!"
      redirect_back_or @project
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "Task '#{@task.title}' updated"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    User.find(params[:id]).destroy
    flash[:success] = "Task '#{@task.title}' deleted"
    redirect_to tasks_url
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :status, :user_id, :project_id)
  end

  # Confirms the correct user.
  def correct_task_user
    @user = User.find(session[:user_id])
    @task = Task.find(params[:id])
    redirect_to(root_url) unless @user.tasks.find_by(id: @task.id)
  end

end
