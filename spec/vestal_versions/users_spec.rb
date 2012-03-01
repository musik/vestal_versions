require 'spec_helper'

describe VestalVersions::Users do
  let(:current_user){ User.create(:name => 'Steve Jobs') }
  let(:user){ User.create(:name => 'Steve Richert') }

  it 'defaults to nil' do
    user.update_attributes(:first_name => 'Stephen')
    user.versions.last.user.should be_nil
  end

  it 'accepts and returns an ActiveRecord user' do
    user.update_attributes(:first_name => 'Stephen', :current_user => current_user)
    user.versions.last.user.should == current_user
  end

  it 'accepts and returns a string user name' do
    user.update_attributes(:first_name => 'Stephen', :current_user => current_user.name)
    user.versions.last.user.should == current_user.name
  end
end
