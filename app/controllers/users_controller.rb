class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(permitted_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  private
  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end
end
