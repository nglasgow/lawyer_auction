require 'spec_helper'

feature "Creating Bids" do
  before do
    Factory(:legal_request, legal_issue: "Hit and Run")
    user = Factory(:user, email: "lr@example.com")
    user.confirm!

    visit '/'
    #click_link 'Current Service Requests'
    click_link "Hit and Run"
    click_link "New Bid"
    message = "You need to sgn in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", with: "lr@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
      within("h2") { page.should have_content("New Bid") }
  end

  scenario "Creating a bid" do
    fill_in "Final bid", with: "45.00"
    fill_in "Preliminary advice", with: "Free lollipop"
    click_button "Create Bid"
    page.should have_content("Bid has been created.")
    within("#bid #author") do
      page.should have_content("Created by lr@example.com")
    end
  end

  scenario "Creating a bid with no values fails" do
    click_button "Create Bid"
    page.should have_content("Bid has not been created.")
    page.should have_content("Bid cannot be blank.")
  end

  scenario "Creating a bid with negative values fails" do
    fill_in "Final bid", with: "-1.00"
    click_button "Create Bid"
    page.should have_content("Bid must be greater than 0")
  end

  scenario "Preliminary advice must be longer than 10 characters" do
    fill_in "Final bid", :with => "35.00"
    fill_in "Preliminary advice", :with => "Don't do that"
    click_button "Create Bid"
    page.should have_content("Bid has not been created.")
    page.should have_content("Preliminary advice is too short")
   end
end
