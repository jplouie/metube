class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :lists
  has_many :videos, through: :lists
  validates :name, presence: true
end
