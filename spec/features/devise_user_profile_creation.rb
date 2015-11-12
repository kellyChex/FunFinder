require_relative '../rails_helper'

describe 'devise user account sign up', :type => :feature do
  it 'should create a User' do
    visit '/users/sign_up'

    fill_in 'Username', :with => 'username'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'

    click_button 'Sign up'
    visit '/'
    expect(page).to have_content 'View My Profile'
  end
end

