class CreateUserQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_quizzes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :quiz_id, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
