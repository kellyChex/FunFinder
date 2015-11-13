require_relative '../rails_helper'

describe "adding map to event", :type => :feature do
 it "will show the location of event" do

   visit '/users/sign_up'

   fill_in 'Username', :with => 'username'
   fill_in 'Email', :with => 'user@example.com'
   fill_in 'Password', :with => 'password'
   fill_in 'Password confirmation', :with => 'password'
   attach_file('user_image', 'spec/images/headshot.png')
   click_button 'Sign up'

   visit '/events'

   click_link('New Event')
   fill_in 'Title', :with => 'New Event'
   attach_file 'event_image', 'spec/images/headshot.png'
   fill_in 'Description', :with => 'myDescription'
   select( '2015', :from => 'event_start_date_1i')
   select( 'November', :from => 'event_start_date_2i')
   select( '11', :from => 'event_start_date_3i')
   select( '2015', :from => 'event_end_date_1i')
   select( 'November', :from => 'event_end_date_2i')
   select( '12', :from => 'event_end_date_3i')
   fill_in 'Location', :with => 'San Diego'
   fill_in 'event_start_time', :with => '00:45:00.000'
   fill_in 'event_start_time', :with => '00:45:00.000'
   fill_in 'event_end_time', :with => '13:09:00.000'
   click_button('Create Event')
   expect(page).to have_content 'Description'
   expect(page).to have_css('#map')
 end
end