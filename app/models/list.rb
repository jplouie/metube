class List < ActiveRecord::Base
  belongs_to :video
  belongs_to :playlist
end
