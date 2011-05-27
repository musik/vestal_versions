require 'spec_helper'

describe VestalVersions::Users do
  let(:updated_by_user){ User.create(:name => 'Steve Jobs') }
  let(:user){ User.create(:name => 'Steve Richert') }

  it 'defaults to nil' do
    user.update_attributes(:first_name => 'Stephen')
    user.versions.last.user.should be_nil
  end

  it 'accepts and returns an ActiveRecord user' do
    user.update_attributes(:first_name => 'Stephen', :updated_by_user => updated_by_user)
    user.versions.last.user.should == updated_by_user
    user.updated_by == updated_by_user
  end

  it 'accepts and returns a string user name' do
    user.update_attributes(:first_name => 'Stephen', :updated_by_user => updated_by_user.name)
    user.versions.last.user.should == updated_by_user.name
  end
end
