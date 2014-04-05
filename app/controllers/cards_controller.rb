class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    card_info = {}
    card_info[:ocr_info] = @card.ocr_info
    card_info[:url] = @card.image.filename_url
    card_info[:name] = "#{@card.first_name} #{@card.middle} #{@card.last_name}"
    card_info[:company] = @card.company
    card_info[:title] = @card.title
    card_info[:address] = @card.street_address
    card_info[:city_state_zip] = "#{@card.city}, #{@card.state} #{@card.zipcode}"
    card_info[:phone] = @card.primary_phone
    card_info[:cell] = @card.cell_phone
    card_info[:email] = @card.email
    card_info[:website] = @card.website

    render :json => card_info.to_json
  end

  # GET /cards/new
  def new
    @card = Card.new
    @card.build_image
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        @card.update_ocr
        format.html { redirect_to edit_card_path(@card.id), notice: 'Card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card }
      else
        format.html { render action: 'new' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to cards_path, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.image.destroy if @card.image.present?
    @card.tags.each { |f| f.delete } if @card.tags.any?
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:ocr_info, :user_id, :tag_list, :first_name, :last_name, :middle, :company, :title, :street_address, :city, :state, :zipcode, :primary_phone, :cell_phone, :email, :website, image_attributes: [:id, :post_id, :filename, :name])
    end
end
