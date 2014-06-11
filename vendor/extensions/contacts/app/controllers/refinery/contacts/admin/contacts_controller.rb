module Refinery
  module Contacts
    module Admin
      class ContactsController < Refinery::AdminController

        crudify :'refinery/contacts/contact', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_contacts
          else
            search_all_contacts
          end

          @grouped_contacts = group_by_date(@contacts)
        end

      end
    end
  end
end
