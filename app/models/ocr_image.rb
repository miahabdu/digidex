class OcrImage
  require 'rubygems'
  require 'RMagick'

  def self.file_name(read_img)
    read_img.path.chomp(File.extname(read_img))
  end

  def self.convert_img(read_img)
    img = Magick::Image::read(read_img.path)[0]
    img.deskew
    img.quantize(256, Magick::GRAYColorspace).contrast(true)
    img.write("#{file_name(read_img)}.tiff")
    img.destroy!
  end

  def self.ocr(read_img)
    read_img = icon_from_url(read_img)
    convert_img(read_img)
    tname = "#{file_name(read_img)}.tiff"

    puts "TR:\t#{tname} created"
      
    # Run tesseract
    tc = "tesseract #{tname} #{file_name(read_img)}"
    puts "TR:\t#{tc}"
    `#{tc}`
     
    File.delete(tname)
    ocr_text = File.open("#{file_name(read_img)}.txt"){|txt| txt.read} rescue "OCR Info couldn't be scanned"
    read_img.close!
    return ocr_text
  end

  def self.icon_from_url(read_img)
    extname = File.extname(read_img)
    basename = File.basename(read_img, extname)

    file = Tempfile.new([basename, extname])
    file.binmode

    open(URI.parse(read_img)) do |data|  
      file.write data.read
    end

    file.rewind

    file
  end

  def self.delete_tmp_txt(read_img)
    File.delete("#{file_name(read_img)}.txt")
  end
end