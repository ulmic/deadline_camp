class AddMiddleNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :middle_name, :string
  end
end
