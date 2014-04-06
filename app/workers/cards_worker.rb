class CardsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(card_id)
    card = Card.find(card_id)
    txt = OcrImage.ocr(card.image.filename_url)
    if txt.blank?
      card.ocr_info = "OCR Info couldn't be scanned"
    else
      card.ocr_info = txt rescue "OCR Info couldn't be scanned"
    end
    card.save
  end
end