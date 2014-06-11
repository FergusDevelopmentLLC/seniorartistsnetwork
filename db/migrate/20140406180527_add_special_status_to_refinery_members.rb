class AddSpecialStatusToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :special_status, :string
  end
end
