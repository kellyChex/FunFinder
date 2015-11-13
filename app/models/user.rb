class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }, unless: "password.nil?"
    validates :password, presence: true, if: "id.nil?"
    validates_format_of :email,:with => Devise.email_regexp

    has_many :followers, :class_name => 'Followings', :foreign_key => 'user_id'
    has_many :following, :class_name => 'Followings', :foreign_key => 'follower_id'

    has_many :events


has_attached_file :image, styles: { thumb: "64x64", med: "100x100", large: "200x200" },
    :default_url => "default_:style.png"
    validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
end
