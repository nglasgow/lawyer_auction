require 'spec_helper'

feature "Editing bids" do
  let!(:legal_request) { Factory(:legal_request) }
  let!(:user){ Factory(:confirmed_user) }
  let!(:bid) do
    bid = Factory(:bid, legal_request: legal_request)
    bid.update_attribute(:user, user)
  end

  before do
    sign_in_as!(user)
    visit '/'
    #click_link 'Current Service Requests'
    click_link legal_request.legal_issue
    click_link bid.final_bid
    click_link "Edit Bid"
  end

  scenario "Updating a bid" do
    fill_in "Final", with: "15.00"
    click_button "Update Bid"
    page.should have_content "Bid has been updated."
    within("#bid h2") do
      page.should have_content("15.00")
    end
    page.should_not have_content bid.final_bid.to_s
  end

  scenario "Updating a bid with invalid information" do
    fill_in "Final bid", with: "-15.00"
    click_button "Update Bid"
    page.should have_content("Bid has not been updated.")
  end
end
