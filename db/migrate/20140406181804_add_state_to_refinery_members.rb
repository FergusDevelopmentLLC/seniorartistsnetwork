class AddStateToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :state, :string
  end
end
