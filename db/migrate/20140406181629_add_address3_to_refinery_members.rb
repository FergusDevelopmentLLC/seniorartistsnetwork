class AddAddress3ToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :address3, :string
  end
end
