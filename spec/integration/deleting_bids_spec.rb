require 'spec_helper'

feature 'Deleting tickets' do
  let!(:legal_request) { Factory(:legal_request) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:bid) do
    bid = Factory(:bid, legal_request: legal_request)
    bid.update_attribute(:user, user)
    bid
  end

  before do
    sign_in_as!(user)
    visit '/'
    #click_link 'Current Service Requests'
    click_link legal_request.legal_issue
    click_link bid.final_bid.to_s
  end

  scenario "Deleting a bid" do
    click_link "Delete Bid"
    page.should have_content("Bid has been deleted.")
    page.current_url.should == legal_request_url(auction)
  end
end
