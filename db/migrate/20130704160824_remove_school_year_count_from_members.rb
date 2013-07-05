class RemoveSchoolYearCountFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :schoolyear_count
  end
end
