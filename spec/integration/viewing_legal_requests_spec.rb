require 'spec_helper'

feature "Viewing legal requests" do
  scenario "Listing all legal requests" do
    legal_request = Factory.create(:legal_request, legal_issue: "DUI")
    visit '/'
    click_link 'Current Legal Issues'
    page.current_url.should == legal_request_url(legal_request)
  end
end
