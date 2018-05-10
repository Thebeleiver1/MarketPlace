class Product < ApplicationRecord
    belongs_to :user, :foreign_key => :sellerId, :primary_key => :id
    mount_uploaders :images, ImageUploader
    validates :sellerId,:images,:name,:price,:location, presence: true    
end
