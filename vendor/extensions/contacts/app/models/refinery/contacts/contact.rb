module Refinery
  module Contacts
    class Contact < Refinery::Core::BaseModel
      self.table_name = 'refinery_contacts'

      attr_accessible :name, :email, :phone_number, :message, :position

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true
      validates :email, :presence => true
      validates :message, :presence => true
    end
  end
end
