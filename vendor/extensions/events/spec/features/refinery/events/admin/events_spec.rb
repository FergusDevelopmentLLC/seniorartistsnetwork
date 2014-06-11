# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Events" do
    describe "Admin" do
      describe "events" do
        refinery_login_with :refinery_user

        describe "events list" do
          before do
            FactoryGirl.create(:event, :artist_name => "UniqueTitleOne")
            FactoryGirl.create(:event, :artist_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.events_admin_events_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.events_admin_events_path

            click_link "Add New Event"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Artist Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Events::Event.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Artist Name can't be blank")
              Refinery::Events::Event.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:event, :artist_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.events_admin_events_path

              click_link "Add New Event"

              fill_in "Artist Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Events::Event.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:event, :artist_name => "A artist_name") }

          it "should succeed" do
            visit refinery.events_admin_events_path

            within ".actions" do
              click_link "Edit this event"
            end

            fill_in "Artist Name", :with => "A different artist_name"
            click_button "Save"

            page.should have_content("'A different artist_name' was successfully updated.")
            page.should have_no_content("A artist_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:event, :artist_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.events_admin_events_path

            click_link "Remove this event forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Events::Event.count.should == 0
          end
        end

      end
    end
  end
end
