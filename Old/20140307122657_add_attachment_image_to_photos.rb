class AddAttachmentImageToPhotos < ActiveRecord::Migration
  def self.up
  add_colomn :photos, image_file_name, :string
  add_colomn :photos, image_content_type, :string
  add_colomn :photos, image_file_size, :integer
  add_colomn :photos, image_updated_at, :datetime
  add_colomn :photos, alt, :float
  add_colomn :photos, lon, :float
  
  
    change_table :photos do |t|

      t.attachment :image

    end
  end

  def self.down
  remove_colomn :photos, image_file_name
  remove_colomn :photos, image_content_type
  remove_colomn :photos, image_file_size
  remove_colomn :photos, image_updated_at
  remove_colomn :photos, alt
  remove_colomn :photos, lon
  
    drop_attached_file :photos, :image

  end
end
