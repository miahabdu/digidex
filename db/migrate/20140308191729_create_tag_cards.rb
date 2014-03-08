class CreateTagCards < ActiveRecord::Migration
  def change
    create_table :tag_cards do |t|
      t.references :card
      t.references :tag
      
      t.timestamps
    end
  end
end
