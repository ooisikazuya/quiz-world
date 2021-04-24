class Api::TopController < ActionController::API
  def index
    @user = current_user
  end
end