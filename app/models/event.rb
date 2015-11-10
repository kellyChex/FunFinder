class Event < ActiveRecord::Base


  belongs_to :user

  validates :title, :presence => true
  validates :start_date, :end_date, :presence => true
  validate :end_after_start
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :location, :presence => true


  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
