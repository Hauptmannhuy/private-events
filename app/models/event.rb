class Event < ApplicationRecord
  validates :date, presence: true
  validates :location, presence: true, length: {minimum: 5, maximum:15}
  validates :description, length: {minimum: 10}
  belongs_to :creator, class_name: "User"
end
