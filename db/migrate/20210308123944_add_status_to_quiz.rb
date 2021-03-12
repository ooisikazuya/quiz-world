class AddStatusToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :status, :integer, null: false, default: 0
  end
end
