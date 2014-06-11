module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :active, :artist_name, :title, :description, :extended_description, :photo_id, :image_tag_line, :start_date, :end_date, :hide_start_end_date, :hours, :address1, :address2, :address3, :city, :state, :zip_code, :phone_number, :website, :position

      validates :title, :presence => true
      validates :description, :presence => true
      validates :start_date, :presence => true
      validates :zip_code, :allow_blank => true, :format => { :with => /\A(\d{5}|\d{0})\z/}

      VALID_PHONE_NUM = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
      validates :phone_number, :allow_blank => true, :format => { with: VALID_PHONE_NUM } #length: { maximum: 10 }

      validates :website, :allow_blank => true, :format => URI::regexp(%w(http https)), :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      def self.get_all_active()
        @events = Event.where("active = true").order("start_date ASC")
      end

    end
  end
end
