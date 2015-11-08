require 'rails_helper'

describe 'devise user account creation' do
  it 'should create a profile linked to the user' do
    visit '/users/sign_up'
    fill_in('Email', :with => 'anEmail@gmail.com')
    fill_in('Password', :with => '12345678')
    fill_in('Password confirmation', :with => '12345678')
    fill_in('Name', :with => 'aName')
    click_button('Sign up')
    visit '/profiles'
    expect(page).to have_content('aName')
  end
end
