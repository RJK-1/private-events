class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :events_users, foreign_key: :attended_event_id, dependent: :delete_all
  has_many :attendees, through: :events_users

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }
end