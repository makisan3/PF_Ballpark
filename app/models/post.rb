class Post < ApplicationRecord

  belongs_to :player
  attachment :image

end
