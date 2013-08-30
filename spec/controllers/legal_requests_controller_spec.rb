require 'spec_helper'

describe LegalRequestsController do
  it "displays an error for a missing legal request" do
    get :show, id: "not-here"
    response.should redirect_to(legal_requests_path)
    message = "The legal request you were looking for could not be found."
    flash[:alert].should == message
  end
end
