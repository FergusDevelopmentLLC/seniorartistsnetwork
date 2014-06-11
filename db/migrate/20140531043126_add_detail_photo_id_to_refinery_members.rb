class AddDetailPhotoIdToRefineryMembers < ActiveRecord::Migration
  def change
    add_column :refinery_members, :detail_photo_id, :integer
  end
end
