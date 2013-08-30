require 'spec_helper'

feature "Viewing bids" do
  before do
    dui = Factory(:legal_request, legal_issue: "DUI")
    user = Factory(:user)
    Factory(:bid,
            legal_request: dui,
            final_bid: "30.00",
            preliminary_advice: "Don't drink and drive")

    hit_and_run = Factory(:legal_request, legal_issue: "Hit and Run")
    Factory(:bid,
            legal_request: hit_and_run,
            final_bid: "20.00",
            preliminary_advice: "Don't do that")

    visit '/'
    # click_link legal_requests_path
  end

  scenario "Viewing bids for a given legal_request" do
    click_link "DUI"
    page.should have_content("30.00")
    page.should_not have_content("20.00")

    click_link "30.00"
    within("#bid h2") do
      page.should have_content("30.00")
    end
    page.should have_content("Don't drink and drive")
  end
end
