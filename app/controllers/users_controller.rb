class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    
  end

  def edit
  end

  def update
    @user.update(user_params)
    flash[:notice] = "会員情報を更新しました！"
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :icon)
  end

  def set_user
    @user = current_user
  end
end
