class Journey < ActiveRecord::Base
belongs_to :user
has_many :photos
validates :uid, presence: true


end
