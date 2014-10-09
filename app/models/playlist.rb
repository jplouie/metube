class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :lists
  has_many :videos, through: :lists
  has_many :comments, :as => :commentable
  validates :name, presence: true
end
