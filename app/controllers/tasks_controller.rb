class TasksController < ApplicationController

  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

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
  end

  def edit
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
    @users = User.all_except
    # @users.to_a.unshift(@user)
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.create(title: params[:title], description: params[:description])
    if @task.save
      flash[:success] = "Task created!"
      redirect_back_or @project
    end
  end

  def update
    # @task = Task.find(params[:id])
    # @user = User.find_by(id: @task.user_id)
    # @user_full_name = "#{@user.first_name} #{@user.last_name}"
    # if @task.update_attributes(update_task_params)
    #   flash[:success] = "Task updated"
    #   redirect_to @task
    # else
    #   render 'edit'
    # end
  end

  def destroy

  end

  private
  def update_task_params
    params.require(:task).permit(:description, :status, :user_id)
  end
end
