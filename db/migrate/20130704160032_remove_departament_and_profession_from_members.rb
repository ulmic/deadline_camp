class RemoveDepartamentAndProfessionFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :department
    remove_column :members, :profession
  end
end
