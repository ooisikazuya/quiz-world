class QuizzesController < ApplicationController
  def show
  end

  def search
    @quizzes = Quiz.released.search(params[:search]).page(params[:page]).per(10).order(created_at: :desc)
  end
end
