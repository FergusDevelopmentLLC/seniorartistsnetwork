class AddActiveToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :active, :boolean
  end
end
