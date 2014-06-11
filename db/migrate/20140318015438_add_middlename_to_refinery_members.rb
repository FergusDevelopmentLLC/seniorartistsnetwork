class AddMiddlenameToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :middlename, :string
  end
end
