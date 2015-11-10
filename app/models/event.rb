class Event < ActiveRecord::Base
  validate do
    #  errors[:start_date] << "cannot be in the past" if date && date < Date.today
    #  errors[:end_date] << "cannot be past the start date" if date && date < start_date
   end

  belongs_to :user

  validates :title, :presence => true
  validates :start_date, :end_date, :presence => true
  validate :end_after_start
  validates :time, :presence => true
  validates :location, :presence => true

  private
  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
   end



end
