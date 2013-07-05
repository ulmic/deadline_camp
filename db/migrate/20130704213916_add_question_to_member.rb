class AddQuestionToMember < ActiveRecord::Migration
  def change
    add_column :members, :question, :text
  end
end
