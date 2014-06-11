class AddAddress1ToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :address1, :string
  end
end
