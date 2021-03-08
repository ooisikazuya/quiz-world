class QuestionsController < ApplicationController
  def destroy
    quiz = Quiz.find(params[:quiz_id])
    quiz.questions.find(params[:id]).destroy!
    redirect_to edit_my_quiz_path(quiz)
  end
end