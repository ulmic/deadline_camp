class AddNewQuestionsToMember < ActiveRecord::Migration
  def change
    add_column :members, :how_long_programming, :text
    add_column :members, :what_you_want, :text
    add_column :members, :what_you_tried, :text
  end
end
