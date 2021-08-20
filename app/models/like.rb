class Like < ApplicationRecord
  belongs_to :player
  belongs_to :school
  validates_uniqueness_of :player_id, scope: :school_id
end
