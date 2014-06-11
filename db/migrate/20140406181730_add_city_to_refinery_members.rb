class AddCityToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :city, :string
  end
end
