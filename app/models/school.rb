class School < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
