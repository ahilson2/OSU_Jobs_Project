require 'rails_helper'
require 'date'
RSpec.describe BookmarksController, :type => :controller do

# Test the Create method
  describe "POST create" do
    context "with valid attributes" do
      # The create method uses a global variable that for this test is created here
      $JOB = {title: "Fiscal Associate",
              department: "Accounts Payable",
              published: Time.new,
              updated: Time.new,
              url: "http://www.jobsatosu.com/postings/63020",
              links: "http://www.jobsatosu.com/postings/63020",
              content: "This position is a float position that works in Equine, Farm Animal, and Small Animal Hospitals, providing front-line client services, document"}
      it "creates a new bookmark" do 
        expect {
          post :create, $JOB 
        }.to change(Bookmark,:count).by(1) 
      end

      it "redirects to the bookmark#index" do 
        post :create, bookmark: FactoryGirl.attributes_for(:bookmark) 
        response.should redirect_to bookmarks_url
        expect(flash[:notice]).to match("Bookmark was successfully created.")
      end 
    end 
  end

  # Test the Destroy method
  describe 'DELETE destroy method' do
    before :each do
      @bookmark = FactoryGirl.create(:bookmark)
    end 
    it "deletes the bookmark" do  
      expect{ 
        delete :destroy, id: @bookmark
      }.to change(Bookmark,:count).by(-1) 
    end 
    
    it "redirects to bookmarks#index" do 
      delete :destroy, id: @bookmark 
      response.should redirect_to bookmarks_url 
      expect(flash[:notice]).to match("Bookmark Was Successfully Removed.")
    end 
  end

end
