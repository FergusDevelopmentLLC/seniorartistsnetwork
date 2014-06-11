class AddFullNameToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :full_name, :text
  end
end
