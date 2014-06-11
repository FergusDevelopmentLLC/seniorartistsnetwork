class AddEmailToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :email, :string
  end
end
