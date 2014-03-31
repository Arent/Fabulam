class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :jid
      t.string :picture
      t.text :text
      t.integer :alt
      t.integer :lon

      t.timestamps
    end
    add_index :photos,[:jid]
  end
end
