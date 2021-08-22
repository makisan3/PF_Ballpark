class Entry < ApplicationRecord
  
  belongs_to :player, optional: true
  belongs_to :school, optional: true
  belongs_to :room
  
end
