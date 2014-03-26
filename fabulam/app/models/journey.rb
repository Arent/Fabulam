class Journey < ActiveRecord::Base
belongs_to :user
validates :uid, presence: true
mount_uploader :image, ImageUploader


end
