class DropIntroInRefineryEvents < ActiveRecord::Migration
  def up
    remove_column :refinery_events, :intro
  end

  def down
  end
end
