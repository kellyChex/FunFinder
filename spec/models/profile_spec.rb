require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a name" do
    aProfile = Profile.new
    aProfile.name = "myName"
    expect(aProfile.name).to eq ("myName")
  end
end
