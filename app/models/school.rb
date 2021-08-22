class School < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :liked_players, through: :likes, source: :player
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def already_liked?(player)
    self.likes.exists?(player_id: player.id)
  end

  attachment :high_school_image

  enum dormitory: {
    有:1,無:2
  }

  # deviseで用意されている処理に対して
  # player_status が true (つまり退会している状態) なのかを
  # 調べて、退会してなければログインする処理を付け足している
  def active_for_authentication?
    super && (self.school_status == false)
  end


end
