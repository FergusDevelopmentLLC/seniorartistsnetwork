class ChangeFullNameFormatInRefineryMembers < ActiveRecord::Migration
  def change
    change_column :refinery_members, :full_name, :string
  end
end
