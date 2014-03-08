class Tag < ActiveRecord::Base
  has_many :tag_cards
  has_many :cards, through: :tag_cards
end
