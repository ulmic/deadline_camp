class RenameInstituteToSchool < ActiveRecord::Migration
  def change
    rename_column :members, :institute, :school
  end
end
