require 'spec_helper'

describe VestalVersions::Users do
  let(:updater){ User.create(:name => 'Steve Jobs') }
  let(:user){ User.create(:name => 'Steve Richert') }

  it 'defaults to nil' do
    user.update_attributes(:first_name => 'Stephen')
    user.versions.last.user.should be_nil
  end

  it 'accepts and returns an ActiveRecord user' do
    user.update_attributes(:first_name => 'Stephen', :updater => updater)
    user.versions.last.user.should == updater
  end

  it 'accepts and returns a string user name' do
    user.update_attributes(:first_name => 'Stephen', :updater => updater.name)
    user.versions.last.user.should == updater.name
  end
end
