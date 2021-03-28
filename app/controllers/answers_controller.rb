class AnswersController < ApplicationController
  def update
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @user_quiz = @quiz.user_quizzes.answering.find_by(user: current_user)
    @user_choices = UserChoice.where(user_quiz_id: @user_quiz, question_id: @quiz.questions)
    @user_choice = @user_choices.where(question_id: @question)
    @user_choice.update(answer_id: @answer.id)
    redirect_to request.referer
  end
end