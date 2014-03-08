class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :user
      t.text :ocr_info

      t.timestamps
    end
  end
end
