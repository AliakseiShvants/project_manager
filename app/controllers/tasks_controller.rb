class TasksController < ApplicationController

  before_action :logged_in_user, only: [:index]
  # before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

  def index
    @tasks = Task.paginate(:page => params[:page])
    @title = "All tasks"
  end

  def show
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
    @user_full_name = "#{@user.first_name} #{@user.last_name}"
    if @task.update_attributes(task_params)
      flash[:success] = "Task updated"
      redirect_to @task
    else
      render 'edit'
    end
  end

  private
  def task_params
    params.require(:task).permit(:description, :status, :user_id)
  end
end
