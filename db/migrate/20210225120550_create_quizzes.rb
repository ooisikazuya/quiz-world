class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :genre, null: false

      t.timestamps
      t.index :genre
      t.index :user_id
    end
  end
end
