class Api::MyQuizzesController < ActionController::API
  def index
    @quizzes = current_user.quizzes.order(created_at: :desc)
  end
end