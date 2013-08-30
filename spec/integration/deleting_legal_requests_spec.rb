require 'spec_helper'

feature "Deleting auctions" do
  scenario "Deleting an auction" do
    Factory(:legal_request, legal_issue: "DUI")
    visit '/'
    #click_link 'Current Legal Requests'
    click_link legal_request.legal_issue
    click_link "Delete Legal Request"
    page.should have_content("Legal request has been deleted.")

    visit '/'
    page.should_not have_content("DUI")
  end
end
