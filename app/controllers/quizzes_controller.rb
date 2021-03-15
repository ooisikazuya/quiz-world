class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.order("RAND()").all.page(params[:page]).per(1)
  end

  def search
    @quizzes = Quiz.released.search(params[:search]).page(params[:page]).per(10).order(created_at: :desc)
  end

  def result
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end
end
