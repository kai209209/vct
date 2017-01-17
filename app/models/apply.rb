class Apply < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :author_id, :receiver_id, presence: true

  enum apply_status: [:apply, :pass, :reject]

  scope :apply_status, -> { where(apply_status: 0) }

end
