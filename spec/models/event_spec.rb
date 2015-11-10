require 'rails_helper'
# require 'factory_girl_rails'

RSpec.describe Event, type: :model do

  it "has a title" do
    aEvent = Event.new
    aEvent.title = 'myTitle'
    expect(aEvent.title).to eq('myTitle')
  end

  it 'has validations on title' do
    aEventEmpty = Event.new
    aEventEmpty.date = '11/9/2015'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.user_id = 1
    aEventEmpty.time = "2015-11-05 16:36:22"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.title = 'Fun Time'
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a location" do
    aEvent = Event.new
    aEvent.location = 'myLocation'
    expect(aEvent.location).to eq('myLocation')
  end

  it 'has validations on location' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.date = '11/9/2015'
    aEventEmpty.user_id = 1
    aEventEmpty.time = "2015-11-05 16:36:22"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.location = 'San Diego'
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a date" do
    aEvent = Event.new
    aEvent.date = '11/9/2015'
    expect(aEvent.date).to eq('11/9/2015')
  end

  it 'has validations on date' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.user_id = 1
    aEventEmpty.time = "2015-11-05 16:36:22"
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.date = '11/9/2015'
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a time" do
    aEvent = Event.new
    aEvent.time = '2000-01-01 16:36:22.000000000'
    expect(aEvent.time).to eq('2000-01-01 16:36:22.000000000')
  end

  it 'has validations on time' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.user_id = 1
    aEventEmpty.date = '11/9/2015'
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.time = "2015-11-05 16:36:22"
    expect(aEventEmpty.valid?).to eq true
  end

  it "has a user" do
    aEvent = Event.new
    aEvent.user_id = 1
    expect(aEvent.user_id).to eq(1)
  end

  it 'has validations on user' do
    aEventEmpty = Event.new
    aEventEmpty.title = 'Fun Time'
    aEventEmpty.location = 'San Diego'
    aEventEmpty.time = "2015-11-05 16:36:22"
    aEventEmpty.date = '11/9/2015'
    expect(aEventEmpty.valid?).to eq false
    aEventEmpty.user_id = 1
    expect(aEventEmpty.valid?).to eq true
  end


end
