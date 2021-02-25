class MyQuizzesController < ApplicationController
  def index
    @quizzes = current_user.quizzes
  end

  def new
    @quiz = Quiz.new
  end

  def create
    current_user.quizzes.create(quiz_params)
    redirect_to my_quizzes_path
  end

  def edit
  end

  def update
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :genre)
  end
end
