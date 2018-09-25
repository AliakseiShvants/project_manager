class UsersController < ApplicationController

  # before_action :logged_in_user,   only: [:index, :show, :edit,  :update]
  before_action :admin_user,       only: [ :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # if @user.tasks.any?
    #   @tasks = @user.tasks.paginate(page: params[:page])
    # end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Project Manager App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    user_full_name = "#{@user.first_name} #{@user.last_name}"
    User.find(params[:id]).destroy
    flash[:success] = "User #{user_full_name} deleted"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user)
          .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user) || admin?
  # end

  def admin_user
    redirect_to(root_url) unless admin?
  end
end
