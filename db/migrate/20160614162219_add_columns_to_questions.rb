class AddColumnsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :asker, :string, null: false
  end
end
