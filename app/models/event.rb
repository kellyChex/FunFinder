class Event < ActiveRecord::Base
  validate do
    #  errors[:start_date] << "cannot be in the past" if date && date < Date.today
    #  errors[:end_date] << "cannot be past the start date" if date && date < start_date
   end

  belongs_to :user
end
