module Refinery
  module Contacts
    class ContactsController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/contacts/thank_you", :include => [:parts])
      end

      def new
        @contact = Contact.new
      end

      def create
        @contact = Contact.new(params[:contact])

        if @contact.save
          begin
            Mailer.notification(@contact, request).deliver
          rescue => e
            logger.warn "There was an error delivering the contact notification.\n#{e.message}\n"
          end

          if Contact.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@contact, request).deliver
            rescue => e
              logger.warn "There was an error delivering the contact confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to Contact if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_contacts_contacts_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/contacts/new', :include => [:parts])
      end

    end
  end
end
