class AddYearJoinedToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :year_joined, :integer
  end
end
