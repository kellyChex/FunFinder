require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a profile linked to the user' do
    aUser = User.new({:id => 1})
    aProfile = Profile.new({:user_id => 1})
    expect(aProfile.user_id).to eq (aUser.id)
  end
end
