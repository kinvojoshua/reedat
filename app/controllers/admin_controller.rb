class AdminController < ApplicationController
  def index
    if current_user.role == 'admin'
      @user = User.all
    else
      redirect_to root_path
    end
  end
end
