class Message < ApplicationRecord
  
  validates :content, presence: true
  belongs_to :player, optional: true
  belongs_to :school, optional: true
  belongs_to :room
  
end
