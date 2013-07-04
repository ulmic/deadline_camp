class AddReasonToMember < ActiveRecord::Migration
  def change
    add_column :members, :reason, :text
  end
end
