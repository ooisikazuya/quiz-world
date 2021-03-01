class MyQuizzesController < ApplicationController
  def index
    @quizzes = current_user.quizzes.order(created_at: :desc)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    current_user.quizzes.create(create_quiz_params)
    flash[:notice] = "クイズを作成しました！"
    redirect_to my_quizzes_path
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.update(update_quiz_params)
    (0..200).each do |i|
      break if params["question_id_#{i}"].nil?
      @question = @quiz.questions.find(params["question_id_#{i}"].to_i)
      @question.content = params["question_content_#{i}"]
      @question.commentary = params["commentary_#{i}"]
      @question.save
      @question.answers.each(&:destroy!)
      5.times do |j|
        @question.answers.create(content: params["answer_content_#{i}_#{j}"], judgment: params["judgment_#{i}_#{j}"]) if params["answer_content_#{i}_#{j}"].present?
      end
    end
    @question = @quiz.questions.create(content: params['question_content'], commentary: params['commentary']) if params['question_content'].present?

    flash[:notice] = "クイズ内容を更新しました！"
    redirect_to edit_my_quiz_path(edit)
  end

  private

  def create_quiz_params
    params.require(:quiz).permit(:title, :genre)
  end

  def update_quiz_params
    params.permit(:title, :genre)
  end
end
