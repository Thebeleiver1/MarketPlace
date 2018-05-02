json.extract! product, :id, :name, :description, :price, :condition, :location, :image, :category, :sellerId, :created_at, :updated_at
json.url product_url(product, format: :json)
