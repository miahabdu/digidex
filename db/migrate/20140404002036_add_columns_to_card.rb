class AddColumnsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :first_name, :string
    add_column :cards, :last_name, :string
    add_column :cards, :middle, :string
    add_column :cards, :company, :string
    add_column :cards, :title, :string
    add_column :cards, :street_address, :string
    add_column :cards, :city, :string
    add_column :cards, :state, :string
    add_column :cards, :zipcode, :string
    add_column :cards, :primary_phone, :string
    add_column :cards, :cell_phone, :string
    add_column :cards, :email, :string
    add_column :cards, :website, :string
  end
end
