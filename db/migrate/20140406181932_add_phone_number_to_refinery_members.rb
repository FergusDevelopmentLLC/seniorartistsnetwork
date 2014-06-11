class AddPhoneNumberToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :phone_number, :string
  end
end
