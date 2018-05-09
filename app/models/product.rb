class Product < ApplicationRecord
    belongs_to :user, :foreign_key => :sellerId, :primary_key => :id
    mount_uploaders :images, ImageUploader
    validates :sellerId, presence: true    
end
