class AddHideStartEndDateToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :hide_start_end_date, :boolean
  end
end
