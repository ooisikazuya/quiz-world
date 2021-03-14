class CreateBulletinBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_boards do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
