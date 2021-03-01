class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :judgment, null: false, default: false

      t.timestamps
    end
  end
end
