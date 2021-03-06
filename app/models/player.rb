class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :liked_schools, through: :likes, source: :school
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  attachment :player_image

  enum grade: {
    中学1年:1,中学2年:2,中学3年:3
  }

  enum base: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  # deviseで用意されている処理に対して
  # player_status が true (つまり退会している状態) なのかを
  # 調べて、退会してなければログインする処理を付け足している
  def active_for_authentication?
    super && (self.player_status == false)
  end

  def self.search(params)
    #if params[:name].blank? && params[:grade].blank? && params[:base].blank? && params[:school].blank? && params[:enrollment].blank?
      #Player.all
    #else
      #Player.where('name LIKE ? AND grade LIKE ? AND base LIKE ? AND school LIKE ? AND enrollment LIKE ?', "%#{params[:name]}%", params[:grade].to_i, params[:base].to_i, "%#{params[:school]}%", "%#{params[:enrollment]}%")
      #byebug
      # Player.where("name LIKE ?", "#{params[:name]}").where("")
      #players = Player.where("name LIKE ?", "#{params[:name]}")
      #players = players.where("grade LIKE ?", "#{params[:grade]}") unless params[:grade] == ""
      #players = Player.where('name LIKE ? AND school LIKE ? AND enrollment LIKE ?', "%#{params[:name]}%", "%#{params[:school]}%", "%#{params[:enrollment]}%")
      players = Player.all
      players = players.where('name LIKE ?', "%#{params[:name]}%" ) unless params[:name] == ""
      players = players.where('school LIKE ?', "%#{params[:school]}%" ) unless params[:shool] == ""
      players = players.where('enrollment LIKE ?', "%#{params[:enrollment]}%" ) unless params[:enrollment] == ""
      players = players.where(grade: params[:grade].to_i) unless params[:grade] == ""
      players = players.where(base: params[:base].to_i) unless params[:base] == ""
      players
    #end
  end



end
