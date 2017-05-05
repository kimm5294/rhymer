class UsersWords < ActiveRecord::Base
  validates :user_id, :word_id, presence: true

  belongs_to :user
  belongs_to :word
end
