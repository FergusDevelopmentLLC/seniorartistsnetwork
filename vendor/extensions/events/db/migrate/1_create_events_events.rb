class CreateEventsEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events do |t|
      t.boolean :active
      t.string :artist_name
      t.string :intro
      t.string :title
      t.text :description
      t.text :extended_description
      t.integer :photo_id
      t.string :image_tag_line
      t.date :start_date
      t.date :end_date
      t.text :hours
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :website
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

  end

end
