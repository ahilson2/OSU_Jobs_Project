require 'rails_helper.rb'
require 'spec_helper.rb'

RSpec.describe Notification, :type => :model do

  it "has a valid factory" do
    FactoryGirl.create(:notification).should be_valid
  end
  
end
