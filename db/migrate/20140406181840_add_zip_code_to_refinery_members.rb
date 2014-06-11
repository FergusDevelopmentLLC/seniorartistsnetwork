class AddZipCodeToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :zip_code, :string
  end
end
