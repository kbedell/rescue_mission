class AddAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer, null: false
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
