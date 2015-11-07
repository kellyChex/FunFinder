require 'rails_helper'

describe "adding image to profile" do
  it "will allow users to upload picture to their profile" do
    visit '/profiles/new'
    fill_in('Name', :with => 'Kelly')
    attach_file('Image', 'app/assets/images/headshot.png')
    click_button('Create Profile')
    page.should have_content('Kelly')
    expect(page).to have_xpath("//img[contains(@src, 'headshot.png')]")
  end
end
