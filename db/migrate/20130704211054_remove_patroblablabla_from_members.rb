class RemovePatroblablablaFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :patronymic
  end
end
