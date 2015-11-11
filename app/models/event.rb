class Event < ActiveRecord::Base


  belongs_to :user

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :end_date, :presence => true
  validates :location, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validate :end_after_start


  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }


  private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
