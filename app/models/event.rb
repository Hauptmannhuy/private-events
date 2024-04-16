class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true, length: {minimum: 2, maximum:15}
  validates :description, length: {minimum: 10}
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  def self.past
    self.all.where('date < :date_today',date_today: Date.today)
  end

  def self.upcoming
    self.all.where('date > :date_today',date_today: Date.today)
  end
end
