require 'rails_helper.rb'
require 'spec_helper.rb'

RSpec.describe Bookmark, :type => :model do

  it "has a valid factory" do
    FactoryGirl.create(:bookmark).should be_valid
  end

end
