class RemoveDegreeAndGpaFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :degree
    remove_column :members, :gpa
  end
end
