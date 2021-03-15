class CreateUserChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_choices do |t|
      t.integer :user_quiz_id, null: false
      t.integer :answer_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
