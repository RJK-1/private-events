class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  #has_many :events, through: :events_users, foreign_key: :attendee_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
