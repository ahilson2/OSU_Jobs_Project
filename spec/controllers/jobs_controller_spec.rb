require 'rails_helper'

RSpec.describe JobsController, :type => :controller do

  # Test for a good connection with OSU jobs ATOM feed
  describe "GET #index" do
    it "returns a 200 after connection with web API" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
