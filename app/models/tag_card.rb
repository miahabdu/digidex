class TagCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :tag
end
