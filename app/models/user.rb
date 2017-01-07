class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  after_create :generate_avatar


  private   
  def generate_avatar
    string = Pinyin.t(self.name)
    avatar = LetterAvatar.generate(string, 100)
    self.update_columns(avatar: avatar)
  end
end
