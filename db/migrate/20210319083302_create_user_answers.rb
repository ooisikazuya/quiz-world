class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.integer :user_quiz_id, null: false, foreign_key: true
      t.integer :question_id, null: false, foreign_key: true
      t.integer :answer_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
