class AddColumnsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_giver, :string, null: false
    add_column :answers, :question_id, :integer, null: false
  end
end
