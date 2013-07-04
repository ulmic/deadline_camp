class RemoveIcqJabberFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :icq
    remove_column :members, :jabber
  end
end
