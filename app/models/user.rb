class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, presence: true, length: {minimum: 5}
	has_many :organized_events, class_name: "Event", dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def to_s
  	"#{username}"
  end

  def full_name
  	"#{first_name} #{last_name}"
  end
end
