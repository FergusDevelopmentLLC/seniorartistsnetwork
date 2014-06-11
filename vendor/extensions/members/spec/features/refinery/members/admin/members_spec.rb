# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Members" do
    describe "Admin" do
      describe "members" do
        refinery_login_with :refinery_user

        describe "members list" do
          before do
            FactoryGirl.create(:member, :firstname => "UniqueTitleOne")
            FactoryGirl.create(:member, :firstname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.members_admin_members_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.members_admin_members_path

            click_link "Add New Member"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Firstname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Members::Member.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Firstname can't be blank")
              Refinery::Members::Member.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:member, :firstname => "UniqueTitle") }

            it "should fail" do
              visit refinery.members_admin_members_path

              click_link "Add New Member"

              fill_in "Firstname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Members::Member.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:member, :firstname => "A firstname") }

          it "should succeed" do
            visit refinery.members_admin_members_path

            within ".actions" do
              click_link "Edit this member"
            end

            fill_in "Firstname", :with => "A different firstname"
            click_button "Save"

            page.should have_content("'A different firstname' was successfully updated.")
            page.should have_no_content("A firstname")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:member, :firstname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.members_admin_members_path

            click_link "Remove this member forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Members::Member.count.should == 0
          end
        end

      end
    end
  end
end
