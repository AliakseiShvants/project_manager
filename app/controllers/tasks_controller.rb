class TasksController < ApplicationController

  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]

  def index
    @tasks = Task.paginate(:page => params[:page])
  end

  def show
    @task = Task.find(params[:id])
    @user = User.find_by(id: @task.user_id)
  end

  def update

  end
end
