class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :quiz_id, null: false, foreign_key: true
      t.text :content, null: false
      t.text :commentary, null: false

      t.timestamps
    end
  end
end
