class AddAddress2ToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :address2, :string
  end
end
