class Event < ApplicationRecord
  has_many :event_places
  has_many :places, through: :event_places
  has_many :posts, as: :postable, dependent: :destroy

  validates :title, :body, :start_date, :end_date, presence: true
end
