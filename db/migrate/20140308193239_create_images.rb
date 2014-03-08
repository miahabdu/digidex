class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :filename
      t.references :card
      
      t.timestamps
    end
  end
end
