class Word < ActiveRecord::Base
  validates :word, presence: true

  has_many :users, through: :users_words

end
