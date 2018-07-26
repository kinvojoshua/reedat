class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  def profile; end

  def confirm
    @user = User.find_by_confirmation_token(params[:token])
    @user.update_attribute(:confirmed_at, Time.now)
    redirect_to welcome_path
  end

  private

  def permitted_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password,
                                 :email)
  end
end
