class LikesController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    current_user.likes.create!(quiz: @quiz)
    flash[:notice] = "挑戦したクイズに”いいね！”しました！"
    redirect_to search_quizzes_path
  end
end