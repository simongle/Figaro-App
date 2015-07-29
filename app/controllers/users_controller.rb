class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_parameters)
    if @user.save
      # Successful new user
      redirect_to @user
      flash[:success] = "Welcome to Figaro!"
    else
      render 'new'
    end
  end

  private
    def user_parameters
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
