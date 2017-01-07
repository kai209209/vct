class AddUserAvatarColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string

    User.all.each do |user|
      string = Pinyin.t(user.name)
      avatar = LetterAvatar.generate(string, 100)
      user.update_columns(avatar: avatar)
    end
  end
end
