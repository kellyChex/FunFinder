require 'rails_helper'

describe 'event creation', :type => :feature do
  it 'should create an event' do
    visit '/events'
    click_link 'New Event'
    fill_in 'Title', :with => 'New Event'
    select( '2015', :from => 'event_start_date_1i')
    select( 'November', :from => 'event_start_date_2i')
    select( '10', :from => 'event_start_date_3i')
    select( '2015', :from => 'event_end_date_1i')
    select( 'November', :from => 'event_end_date_2i')
    select( '11', :from => 'event_end_date_3i')
    fill_in 'Location', :with => 'San Diego'
    select( '10', :from => 'event_time_4i')
    select( '00', :from => 'event_time_5i')
    click_button 'Create Event'

    expect(page).to have_content 'Event was successfully created.'

  end

end
