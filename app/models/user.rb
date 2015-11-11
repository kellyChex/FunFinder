class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }, unless: "password.nil?"
    validates :password, presence: true, if: "id.nil?"
    validates_format_of :email,:with => Devise.email_regexp

    has_many :events

    # accepts_nested_attributes_for :event

		has_attached_file :image, styles: { thumb: "64x64", med: "100x100", large: "200x200" }, :default_url => "default_:style.png", size: { in: 0..10.megabytes }

		validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
