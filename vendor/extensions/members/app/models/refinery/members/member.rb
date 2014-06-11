module Refinery
  module Members
    class Member < Refinery::Core::BaseModel
      self.table_name = 'refinery_members'

      attr_accessible :firstname, :middlename, :lastname, :photo_id, :detail_photo_id, :bio, :position, :url, :full_name, :special_status, :year_joined, :active, :email, :address1, :address2, :address3, :city, :state, :zip_code, :phone_number

      validates :lastname, :presence => true
      validates :full_name, :presence => true, :uniqueness => true

      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, :allow_blank => true, :format => { with: VALID_EMAIL_REGEX }, :uniqueness => { case_sensitive: false }

      validates :zip_code, :allow_blank => true, :format => { :with => /\A(\d{5}|\d{0})\z/}

      VALID_PHONE_NUM = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
      validates :phone_number, :allow_blank => true, :format => { with: VALID_PHONE_NUM } #length: { maximum: 10 }

      validates :url, :allow_blank => true, :format => URI::regexp(%w(http https)), :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      belongs_to :detail_photo, :class_name => '::Refinery::Image'

      acts_as_indexed :fields => [:firstname, :lastname, :full_name]

      def self.search(search, page)

        firstname = search.split(' ', 2).first
        lastname = search.split(' ', 2).last

        #puts search
        #puts firstname
        #puts lastname
        #puts page

        paginate :per_page => 1000, :page => page,
                 :conditions => ['active = true AND (firstname ILIKE (?) or lastname ILIKE (?))', "#{firstname}%", "#{lastname}%"],
                 :order => 'lastname ASC'
      end

    end
  end
end
