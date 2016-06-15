class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.text :summary, null: false

      t.timestamps null: false
    end
  end
end
