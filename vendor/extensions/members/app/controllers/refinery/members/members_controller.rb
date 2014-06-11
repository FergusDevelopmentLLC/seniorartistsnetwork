module Refinery
  module Members
    class MembersController < ::ApplicationController
      before_filter :find_all_members
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @member in the line below:
        present(@page)
      end

      def show
        @member = Member.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @member in the line below:
        present(@page)
      end

    protected

      def find_all_members
        #@members = Member.order('lastname ASC')

        #@members = Member.paginate :per_page => 1,
        #                           :page => params[:page],
        #                           :order => 'lastname ASC'

        #params[:search]
        #print "Apple "
        #print params[:search] + "x"
        @members = Member.search(params[:search].to_s(), params[:page])

      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/members").first
      end

    end
  end
end
