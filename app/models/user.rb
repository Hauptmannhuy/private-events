class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :events, foreign_key: :creator_id
  
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event

  
end
