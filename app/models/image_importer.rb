class ImageImporter
  
  def self.image_from_url(read_img)
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
end