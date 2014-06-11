module Refinery
  module Members
    module Admin
      class MembersController < ::Refinery::AdminController

        crudify :'refinery/members/member',
                :title_attribute => 'full_name',
                :xhr_paging => true,
                :order => "lastname ASC"

      end
    end
  end
end
