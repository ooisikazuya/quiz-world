class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :title, null: false, default: ""
      t.string :genre, null: false, default: ""

      t.timestamps
      t.index :genre
      t.index :user_id
    end
  end
end
