class RemoveFinishYearAndFinishMonthFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :finish_year
    remove_column :members, :finish_month
  end
end
