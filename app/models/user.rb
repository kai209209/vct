class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  after_create :generate_avatar

  has_many :author_applies, class_name: "Apply", foreign_key: 'author_id'
  has_many :receiver_applies, class_name: "Apply", foreign_key: 'receiver_id'

  def self.search(params, current_user)
    users = User.where("users.name or users.email LIKE ?", "%#{params[:content]}%").where.not(id: current_user.id) if params[:content].present?
    users
  end

  private
  def generate_avatar
    string = Pinyin.t(self.name)
    avatar = LetterAvatar.generate(string, 100)
    self.update_columns(avatar: avatar)
  end
end
