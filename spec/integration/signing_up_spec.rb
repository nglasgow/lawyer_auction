require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in "Email", :with => "user@lr.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    message = "You have signed up successfully."
    page.should have_content(message)
  end
end
