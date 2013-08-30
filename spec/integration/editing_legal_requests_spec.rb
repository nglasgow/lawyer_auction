require 'spec_helper'

feature "Editing Auctions" do
  before do
    Factory(:legal_request, legal_issue: "DUI")
    visit '/'
    #click_link 'Current Legal Requests'
    click_link "Edit Legal Request"

  scenario "Updating an legal request" do
    fill_in "Legal Issue", with: "DUI"
    click_button "Update Legal Request"
    page.should have_content("Legal request has been updated.")
  end

  scenario "Updating an legal request with invalid attributes is bad" do
    fill_in "Legal Issue", with: "DUI"
    click_button "Update Legal Request"
    page.should have_content("Legal request has not been updated.")
  end
end
