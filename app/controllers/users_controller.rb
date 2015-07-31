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
      # Log the user in
      log_in @user
      # Display success message
      flash[:success] = "Welcome to Figaro!"
      # Redirect to profile page
      redirect_to @user
    else
      # If failed, reload the signup form
      render 'new'
    end
  end

  private
    # Only allow 4 fields to be posted with form, no tricks!
    def user_parameters
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
