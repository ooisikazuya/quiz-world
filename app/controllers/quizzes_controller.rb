class QuizzesController < ApplicationController
  def start
    @quiz = Quiz.find(params[:id])
    @user_quiz = @quiz.user_quizzes.answering.find_or_initialize_by(user: current_user)
    if @user_quiz.new_record?
      @user_quiz.save!
      @quiz.questions.shuffle.each do |question|
        @user_quiz.user_choices.create!(question: question)
      end
    end
    redirect_to quiz_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @user_quiz = @quiz.user_quizzes.where(user: current_user).last
    return redirect_to search_quizzes_path unless @user_quiz
    question_ids = @user_quiz.user_choices.pluck(:question_id)
    @all_questions = Question.where(id: question_ids).order_as_specified(id: question_ids)
    @questions = @all_questions.page(params[:page]).per(1)
    unless @user_quiz.user_answers.present?
      @all_questions.each do |question|
        question.answers.shuffle.each do |answer|
          @user_quiz.user_answers.create!(question: question, answer: answer)
        end
      end
    end
    @questions.each_with_index do |question, i|
      question_answer_ids = @user_quiz.user_answers.pluck(:answer_id)
      @question_answers = Answer.where(id: question_answer_ids, question_id: question).order_as_specified(id: question_answer_ids)
      @answering_choices = question.user_choices.where(user_quiz: @user_quiz)
      answer_id = @answering_choices[i].answer_id
      @answers = question.answers.where(id: answer_id)
      @right_answers = question.answers.where(judgment: true)
    end
  end

  def search
    @quizzes = Quiz.released.search(params[:search]).page(params[:page]).per(10).order(created_at: :desc)
    user_quiz_ids = UserQuiz.where(user: current_user, status: 0).pluck(:quiz_id)
    @user_quizzes = Quiz.where(id: user_quiz_ids)
  end

  def result
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    if (@user_quiz = @quiz.user_quizzes.where(user: current_user).last).present?
      @user_quiz.finished! if @user_quiz.answering?
    else
      return redirect_to search_quizzes_path
    end
    @user_choices = UserChoice.where(user_quiz_id: @user_quiz, question_id: @questions)
    @user_answers = @user_choices.pluck(:answer_id)
    @answers = Answer.where(id: @user_answers)
    @true_answers = @answers.where(judgment: true)
    @likes = current_user.likes.where(quiz_id: @quiz)
  end

  def like
    @likes = current_user.likes.pluck(:quiz_id)
    @quizzes = Quiz.where(id: @likes)
  end
end