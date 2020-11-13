class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :website, :location, :cuisine
end
