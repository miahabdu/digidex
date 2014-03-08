class Image < ActiveRecord::Base
  belongs_to :card
  mount_uploader :filename, ImageUploader
end
