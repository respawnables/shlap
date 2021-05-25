class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update destroy]

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /signup
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Rails Blog, #{@user.username}"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && @user == current_user
      flash[:alert] = 'You can only edit or delete your own account'
      redirect_to @user
    end
  end
end
