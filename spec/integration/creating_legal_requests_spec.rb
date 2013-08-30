require 'spec_helper'

  feature 'Creating Legal Request Auctions' do
    before do
      visit '/'
      click_link 'New Legal Request'
    end

    scenario "can create a legal request auction" do
      fill_in 'Legal Issue', with: 'DUI Ticket'
      fill_in 'Description', with: "Need to be represented"
      click_button 'Create Auction'
      page.should have_content('Auction has been initiated.')

      legal_request = Legal_request.find_by_name("DUI")
      page.current_url.should == legal_request_url(legal_request)
      title = "DUI = Legal_Requests - Lawyer_Auction"
      find("title").should have_content(title)
    end

    scenario "Cannot create a legal without a legal issue" do
      click_button 'Create Auction'
      page.should have_content("Auction has not been initiated.")
      page.should have_content("Legal issue can't be blank")
    end
  end
