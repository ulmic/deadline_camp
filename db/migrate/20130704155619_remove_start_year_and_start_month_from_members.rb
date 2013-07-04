class RemoveStartYearAndStartMonthFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :start_year
    remove_column :members, :start_month
  end
end
