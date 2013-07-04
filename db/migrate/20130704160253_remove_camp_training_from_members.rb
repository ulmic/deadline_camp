class RemoveCampTrainingFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :camp_training
  end
end
