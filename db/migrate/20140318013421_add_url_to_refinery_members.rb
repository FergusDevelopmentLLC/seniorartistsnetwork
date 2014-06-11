class AddUrlToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :url, :string
  end
end
