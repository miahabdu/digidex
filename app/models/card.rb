class Card < ActiveRecord::Base
  belongs_to :user

  has_many :tag_cards
  has_many :tags, through: :tag_cards
  has_one :image

  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank

  def update_ocr
    txt = OcrImage.ocr(self.image.filename_url)
    if txt.blank?
      self.ocr_info = "OCR Info couldn't be scanned"
    else
      self.ocr_info = txt rescue "OCR Info couldn't be scanned"
    end
    self.save
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).cards
  end

  def self.tag_counts
    Tag.select("tags.*, count(tag_cards.tag_id) as count").
      joins(:tag_cards).group("tag_cards.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
