require 'rails_helper'

RSpec.describe NotificationsController, :type => :controller do

# Test the Create method
  describe "POST create" do
    context "with valid attributes" do
     
      it "creates a new notification" do 
        expect {
          post :create, notification: {job_title: 'Fiscal Associate',department: 'Accounts Payable'}
        }.to change(Notification,:count).by(1) 
      end

      it "redirects to the notification#index" do 
        post :create, notification: {job_title: 'Fiscal Associate',department: 'Accounts Payable    '} 
        response.should redirect_to notifications_url
        expect(flash[:notice]).to match("Email Notification was successfully created.")
      end 
    end 
  end

  # Test the Destroy method
  describe 'DELETE destroy method' do
    before :each do
      @notification = FactoryGirl.create(:notification)
    end 
    it "deletes the notification" do  
      expect{ 
        delete :destroy, id: @notification
      }.to change(Notification,:count).by(-1) 
    end 
    
    it "redirects to notifications#index" do 
      delete :destroy, id: @notification 
      response.should redirect_to notifications_url 
      expect(flash[:notice]).to match("Email Notification Was Successfully Removed.")
    end 
  end

end
